#!/usr/bin/env python3

import re
from vcdvcd import VCDVCD

cpuregs_only_mode = False
exclude_cpuregs = True

def vcd_extend(v, n):
    extbit = v[-1]
    if extbit == "1": extbit="0"
    return extbit*(n-len(v)) + v

class VcdData:
    def __init__(self):
        self.data = dict()
        self.refbits = set()
        self.onebits = set()
        self.zerobits = set()

        self.currentPrefix = None
        self.currentTop = None
        self.references = None
        self.bitnames = None
        self.framecnt = None

    def enddefinitions(self, vcd, signals, cur_sig_vals):
        """Called by VCDVCD at $enddefinitions"""
        for key in vcd.data:
            for name in vcd.data[key].references:
                if "BUF" in name or "._" in name: continue
                if "dbg" in name: continue
                if name.startswith(self.currentTop):
                    name = name[len(self.currentTop):]
                    if name.startswith("\\"): name = name[1:]
                    if name.startswith("_"): continue
                    if name.endswith("_"): continue
                    if exclude_cpuregs:
                        if name.startswith("cpuregs_reg_r") and name.endswith("]"): continue
                        if name.startswith("cpuregs["): continue
                    if cpuregs_only_mode:
                        if name.startswith("cpuregs_reg_r") and name.endswith("]"): break
                        if name.startswith("cpuregs["): break
                    else:
                        break
            else:
                continue
            if self.currentDepth == 0 or self.currentDepth > name.count(".") or ".\\mem" in name:
                name = self.currentPrefix + name
                self.references[key] = name
                if vcd.data[key].size == "1":
                    self.bitnames[name, 0] = name
                else:
                    for idx in range(int(vcd.data[key].size)):
                        self.bitnames[name, idx] = f"{name}<{idx}>"
                print(f"Signal: {name}")
        print(f"  found {len(self.references)} signals with {len(self.bitnames)} bits", flush=True)

    def time(self, vcd, time, cur_sig_vals):
        """Called by VCDVCD whenever a new time is found."""
        if cur_sig_vals[vcd.references_to_ids["testbench.clk"]] == '0':
            return

        self.framecnt += 1
        if self.framecnt % 10000 == 0:
            print(f"  frame #{self.framecnt} at {time}", flush=True)

        if time not in self.data:
            self.data[time] = dict()

        frame = self.data[time]
        for key, name in self.references.items():
            bits = vcd_extend(cur_sig_vals[key], int(vcd.data[key].size))
            for idx, bit in enumerate(reversed(bits)):
                refbit = self.bitnames[name, idx]
                if bit == "1":
                    self.onebits.add(refbit)
                elif bit == "0":
                    self.zerobits.add(refbit)
                self.refbits.add(refbit)
                frame[refbit] = bit

    def value(self, vcd, time, value, identifier_code, cur_sig_vals):
        """Called by VCDVCD whenever the value of a signal changes."""
        pass

    def parse(self, vcdfile, prefix, top, depth, signals):
        self.currentPrefix = prefix
        self.currentTop = top
        self.currentDepth = depth
        self.references = dict()
        self.bitnames = dict()
        self.framecnt = 0

        vcd = VCDVCD(vcdfile, signals=signals, callbacks=self, store_tvs=False)

        self.currentPrefix = None
        self.currentTop = None
        self.currentDepth = None
        self.references = None
        self.bitnames = None
        self.framecnt = None


class SignalGroup:
    def __init__(self):
        self.members = set()
        self.zeros = set()
        self.ones = set()
        self.undefs = set()
        self.trace = ""

    def __str__(self):
        def show_first_n(s, n):
            if len(s) <= n:
                return ",".join(sorted(s))
            return ",".join(sorted(s)[0:n])+f"+{len(s)-n}"
        return f"""G({show_first_n(self.members, 10)}):
    zeros:  [{show_first_n(self.zeros, 5)}],
    ones:   [{show_first_n(self.ones, 5)}],
    undefs: [{show_first_n(self.undefs, 5)}],
    trace:  {self.trace}
"""


class SignalDatabase:
    def __init__(self):
        self.vcdData = VcdData()

    def parse(self, vcdfile, prefix, top, signals=None):
        print(f"Reading {top} from {vcdfile} as {prefix}..", flush=True)
        self.vcdData.parse(vcdfile, prefix+".", top+".", 1, signals)

    def mk(self):
        self.groups.add(group := SignalGroup())
        self.dirtyGroups.add(group)
        return group

    def add(self, group, member):
        if member not in self.members:
            self.members[member] = set()
        self.members[member].add(group)
        group.members.add(member)

    def rem(self, group, member=None):
        if member is None:
            for member in group.members:
                self.members[member].remove(group)
            self.groups.remove(group)
        else:
            self.dirtyGroups.add(group)
            self.members[member].remove(group)
            group.members.remove(member)

    def cleanup(self):
        for group in self.dirtyGroups:
            hasGold = any([m.startswith("gold.") for m in group.members])
            hasGate = any([m.startswith("gate.") for m in group.members])
            if not hasGold or not hasGate: self.rem(group)
        self.dirtyGroups = set()

    def process(self):
        self.groups = set()
        self.dirtyGroups = set()
        self.members = dict()
        self.const_one = set()
        self.const_zero = set()

        rootGroup = self.mk()
        for name in self.vcdData.refbits:
            found_one = name in self.vcdData.onebits
            found_zero = name in self.vcdData.zerobits
            if found_one and not found_zero: self.const_one.add(name)
            if found_zero and not found_one: self.const_zero.add(name)
            if not found_one or not found_zero: continue
            self.add(rootGroup, name)

        somethingHappened = True
        for time, frame in self.vcdData.data.items():
            if somethingHappened:
                maxsizes = list(reversed(sorted([len(g.members) for g in self.groups])))
                print(f"At {time}: {len(self.groups)} groups, max sizes are {maxsizes[:5]}", flush=True)
                somethingHappened = False

            for name, bit in frame.items():
                if name not in self.members: continue
                for group in self.members[name]:
                    if bit == "0":
                        group.zeros.add(name)
                    elif bit == "1":
                        group.ones.add(name)
                    elif bit == "x" or bit == "z":
                        group.undefs.add(name)
                    else:
                        assert False

            for group in list(self.groups):
                if len(group.zeros) and len(group.ones):
                    somethingHappened = True
                    newGroup = self.mk()
                    for name in group.ones:
                        self.add(newGroup, name)
                        self.rem(group, name)
                    for name in group.undefs:
                        self.add(newGroup, name)
                    newGroup.trace = group.trace + f"1"
                    group.trace += f"0"
                else:
                    group.trace += "_" if len(group.zeros) else "-" if len(group.ones) else "x"

                group.zeros = set()
                group.ones = set()
                group.undefs = set()

            self.cleanup()

    def print(self):
        print(f"Found {len(self.const_zero)} constant zero signals:")
        for name in sorted(self.const_zero):
            print(f"  {name}")
        print(f"Found {len(self.const_one)} constant one signals:")
        for name in sorted(self.const_one):
            print(f"  {name}")

        if True:
            G = set()
            for group in self.groups:
                for name in sorted(group.members):
                    if name.startswith("gold."):
                        n = "gate" + name[4:]
                        if n in group.members: break
                else:
                    G.add(tuple(sorted(group.members)))

            print(f"Left with {len(G)} groups after sorting and filtering:")
            for idx, group in enumerate(sorted(G)):
                print(f"  Group {idx}:")
                for name in group:
                    print(f"    {name}")
        else:
            for idx, group in enumerate(self.groups):
                for name in sorted(group.members):
                    if name.startswith("gold."):
                        n = "gate" + name[4:]
                        if n in group.members: break
                print(f"  Group {idx}:")
                for name in group.members:
                    print(f"    {name}")

        cpuregs = dict()
        for group in self.groups:
            m = tuple(sorted(group.members))
            if len(m) == 3 and m[0].startswith("gate.cpuregs_reg_r1_") and m[1].startswith("gate.cpuregs_reg_r2_") and m[2].startswith("gold.cpuregs["):
                match = re.match(r"gold.cpuregs\[(\d+)\]\[(\d+)\]", m[2])
                cpuregs[int(match[1]), int(match[2])] = (m[2], m[0], m[1])
        if cpuregs:
            print(f"Matched {len(cpuregs)} CPU Register bits:")
            for k in sorted(cpuregs):
                gold_1 = cpuregs[k][0][5:]
                gold_2 = re.sub(r"cpuregs\[(\d+)\]", r"dbg_reg_x\1", gold_1)
                gate_1 = cpuregs[k][1][5:].replace(".\\", ".")
                gate_2 = cpuregs[k][2][5:].replace(".\\", ".")
                print(f"gold-match {gold_1} {gate_1}")
                print(f"gold-match {gold_2} {gate_2}")

db = SignalDatabase()
db.parse("test_gold.vcd", "gold", "testbench.uut")
db.parse("test_gate.vcd", "gate", "testbench.uut")
db.process()
db.print()

