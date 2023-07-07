#!/usr/bin/env python3
#
# Preprocessor for formal-friendly Verilog models for the SkyWater PDK
#
# Copyright (C) 2023  Jannis Harder <jix@yosyshq.com> <me@jix.one>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

import argparse
import re
import itertools
import sys

description = "Preprocessor for formal-friendly Verilog models for the SkyWater PDK."
description += """
This script takes the primitives.v and <pdk_name>.v files from the SkyWater PDK and
preprocesses them into a synthesizable Yosys-compatible form, allowing Yosys based
formal verification of Verilog netlists using PDK cells.

This script isn't very smart and will probably need to be updated when there are
significant changes to the PDK.

It performs the following actions:

* Resolves `ifdefs (with an implicit `FUNCTIONAL define) and removes `UNIT_DELAY. This
  isn't a full Verilog preprocessor, but it's enough to handle the PDK Verilog files.

* Adds (* noblackbox *) attributes to all modules, as the PDK contains some modules
  without logic.

* Replaces pullup and pulldown primitives which Yosys doesn't support with mod_pullup
  and mod_pulldown instances.

* Replaces pwrgood with primitives that assume the power is always good.

* Automatically replaces combinational UDPs with a casez-based module implementation.

* Replaces the few remaining stateful UDPs with manually written synthesizable modules.

"""

parser = argparse.ArgumentParser(
    formatter_class=argparse.RawDescriptionHelpFormatter,
    description=description,
)

parser.add_argument(
    "sources",
    type=argparse.FileType("r"),
    nargs="+",
    help="paths to the primitives.v and <pdk_name>.v files",
)

parser.add_argument(
    "--output",
    "-o",
    type=argparse.FileType("w"),
    help="path to the synthesizable verilog output file",
)
parser.add_argument(
    "--define",
    "-D",
    help="add additional defines (does not support defined values)",
    action="append",
    default=[],
)

args = parser.parse_args()


def out(*out_args, **kwds):
    print(*out_args, **kwds, file=args.output)


defines = set(["FUNCTIONAL", *args.define])


def handle_ifdefs(lines):
    ifdef_stack = []

    current_lines_active = True

    for line in lines:
        if "//" in line:
            line = line[: line.index("//")] + "\n"
        words = line.split()

        if words and words[0] == "`ifdef":
            name = words[1]
            ifdef_stack.append((name, name in defines))
            current_lines_active = all(cond for name, cond in ifdef_stack)
            continue
        elif words and words[0] == "`ifndef":
            name = words[1]
            ifdef_stack.append((name, name not in defines))
            current_lines_active = all(cond for name, cond in ifdef_stack)
            continue
        elif words and words[0] == "`else":
            last_name, last_cond = ifdef_stack.pop()
            ifdef_stack.append((last_name, not last_cond))
            current_lines_active = all(cond for name, cond in ifdef_stack)
            continue
        elif words and words[0] == "`endif":
            ifdef_stack.pop()
            current_lines_active = all(cond for name, cond in ifdef_stack)
            continue
        if not current_lines_active:
            continue

        if words and words[0] == "`define":
            name = words[1]
            defines.add(name)
            continue

        if current_lines_active:
            yield line


source = "".join(handle_ifdefs(itertools.chain.from_iterable(args.sources)))

item_re = re.compile(
    r"""(?P<kind>module|primitive)\s*(?P<name>\S+)\s*\((?P<ports>.*?)\)\s*;"""
    r"""(?P<contents>.*?)"""
    r"""\bend(?P=kind)""",
    re.DOTALL,
)

supply_re = re.compile(r"supply\s*\((?P<ports>.*?)\)\s*;")

pull_re = re.compile(r"\bpull(up|down)\b")


def port_re(direction, name):
    return re.compile(rf"\b{re.escape(direction)}\s+{re.escape(name)}\s*;")


for found in item_re.finditer(source):
    kind = found["kind"]
    name = found["name"]
    ports = found["ports"].strip()
    contents = found["contents"]

    contents = pull_re.subn(lambda match: "mod_pull" + match[1], contents)[0]

    ports = [port.strip() for port in ports.split(",")] if ports else []

    if kind == "module":
        contents = contents.replace("`UNIT_DELAY", "")

        out(f"(* noblackbox *) module {name} ({','.join(ports)});")
        out(contents)
        out("endmodule")
    else:
        if "$PG" in name:
            continue

        outputs = []
        inputs = []
        regs = []
        table_lines = []

        lines = iter(contents.split(";"))

        for line in lines:
            words = line.split()

            if words and words[0] == "output":
                outputs.append(words[1].rstrip(";"))
            elif words and words[0] == "input":
                inputs.append(words[1].rstrip(";"))
            elif words and words[0] == "reg":
                regs.append(words[1].rstrip(";"))
            elif words and words[0] == "table":
                table_lines.append("".join(words[1:]))
                for line in lines:
                    words = line.split()
                    if words and words[0] == "endtable":
                        break
                    table_lines.append("".join(words))

        assert ports == outputs + inputs

        def start_module(out_regs=False):
            out(f"(* noblackbox *) module {name} ({','.join(ports)});")
            for port in outputs:
                out(f"output {port};")

            if out_regs:
                for reg in outputs:
                    out(f"reg {reg};")

            for port in inputs:
                out(f"input {port};")
            for reg in regs:
                out(f"reg {reg};")

        if "pwrgood" in name and "UDP_IN" in ports and "UDP_OUT" in ports:
            start_module()
            out("assign UDP_OUT = UDP_IN;")
            out("endmodule")
        elif not regs:
            start_module(out_regs=True)

            out(f"always @* casez ({{{','.join(inputs)}}})")
            for line in table_lines:
                inbits, outbits = line.split(":")
                out(
                    f"  {len(inbits)}'b{inbits}: "
                    f"{{{','.join(outputs)}}} = {len(outbits)}'b{outbits};"
                )
            out("endcase;")
            out("endmodule")
        elif name.endswith("__udp_dff$P"):
            start_module()

            out("always @(posedge CLK) Q <= D;")
            out("endmodule")
        elif name.endswith("__udp_dff$PR"):
            start_module()

            out("always @(posedge CLK or posedge RESET)")
            out("  if (RESET) Q <= 1'b0;")
            out("  else Q <= D;")
            out("endmodule")
        elif name.endswith("__udp_dff$PS"):
            start_module()

            out("always @(posedge CLK or posedge SET)")
            out("  if (SET) Q <= 1'b1;")
            out("  else Q <= D;")
            out("endmodule")
        elif name.endswith("__udp_dff$NSR"):
            start_module()

            out("wire AD = SET;")
            out("wire AL = SET | RESET;")

            out("always @(negedge CLK_N or posedge AL)")
            out("  if (AL) Q <= AD;")
            out("  else Q <= D;")
            out("endmodule")
        elif name.endswith("__udp_dlatch$P") or name.endswith("__udp_dlatch$lP"):
            start_module()

            out("always @(GATE or D)")
            out("  if (GATE) Q <= D;")
            out("endmodule")
        elif name.endswith("__udp_dlatch$PR"):
            start_module()

            out("wire AG = GATE | RESET;")
            out("wire AD = (~RESET) & D;")

            out("always @(AG or AD)")
            out("  if (AG) Q <= AD;")
            out("endmodule")
        else:
            print("unknown primitive", name, ports, file=sys.stderr)
            print(contents, file=sys.stderr)

out("(* noblackbox *) module mod_pullup (Y);")
out("output Y;")
out("assign Y = 1'b1;")
out("endmodule")
out("(* noblackbox *) module mod_pulldown (Y);")
out("output Y;")
out("assign Y = 1'b0;")
out("endmodule")
