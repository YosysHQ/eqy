#!/usr/bin/env python3
#
# Equivalence Checking with Yosys (eqy)
#
# Copyright (C) 2020 Claire Wolf <claire@symbioticeda.com>
# Copyright (C) 2020 N. Engelhardt <nak@symbioticeda.com>
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
import argparse, types, re, glob
import os, sys, tempfile, shutil
import shlex, fnmatch, textwrap
import click, json, collections
##yosys-sys-path##

from eqy_job import EqyJob, EqyTask

def exit_with_error(error, retcode=1):
    print("ERROR:", error, file=sys.stderr)
    exit(retcode)

def root_path():
    fn = getattr(sys.modules['__main__'], '__file__')
    root_path = os.path.abspath(os.path.dirname(fn))
    return root_path

class DictAction(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        assert isinstance(getattr(namespace, self.dest), dict), "Use ArgumentParser.set_defaults() to initialize {} to dict()".format(self.dest)
        name = option_string.lstrip(parser.prefix_chars).replace("-", "_")
        getattr(namespace, self.dest)[name] = values

def parse_args():
    parser = argparse.ArgumentParser(prog="eqy",
            usage="%(prog)s [options] <config>.eqy")
    parser.set_defaults(exe_paths=dict())

    parser.add_argument("eqyfile", metavar="<config>.eqy", type=argparse.FileType('r'), nargs='?',
            help=".eqy configuration file (use - for stdin)")

    dirargs = parser.add_mutually_exclusive_group()
    dirargs.add_argument("-c", "--continue", action="store_true", dest="cont",
            help="re-run using existing workdir")
    dirargs.add_argument("-f", "--force", action="store_true", dest="force",
            help="remove workdir if it already exists")
    dirargs.add_argument("-b", "--backup", action="store_true", dest="backup",
            help="backup workdir if it already exists")
    dirargs.add_argument("-t", "--tmp", action="store_true", dest="tmpdir",
            help="run in a temporary workdir (remove when finished)")

    parser.add_argument("-d", metavar="<dirname>", dest="workdir",
            help="set workdir name. default: <jobname>")

    parser.add_argument("-m", "--setup", action="store_true", dest="setupmode",
            help="generate partitions and makefiles and exit")

    parser.add_argument("-k", "--keep-going", action="store_true",
            help="keep going when some make targets can't be made")

    parser.add_argument("-j", "--jobs", metavar="<N>", type=int, action="store", dest="num_jobs",
            help="Allow running <N> make jobs at once")

    parser.add_argument("-P", "--purge", action="append", dest="purgelist", metavar="<pattern>",
            help="purge any <partition>/<strategy> pair, supports wildcards")

    parser.add_argument("-p", action="append", dest="commands", nargs=2, metavar=("<command>", "<partition>"),
            help="run the provided yosys command(s) on the specified partition(s) and exit")

    parser.add_argument("-g", "--debug", action="store_true", dest="debugmode",
            help="enable debug mode")

    initcfg = parser.add_argument_group("template config file writer")
    initcfg.add_argument("--init-config-file", metavar=("<eqy-config-file>", "<top-module>", "<gold-verilog>", "<gate-verilog>"), nargs=4,
            help="create a default .eqy config file for the given top module and gold and gate source files")

    exes = parser.add_argument_group("path arguments")
    exes.add_argument("--yosys", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--abc", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--smtbmc", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--suprove", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--aigbmc", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--avy", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--btormc", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths")
    exes.add_argument("--pono", metavar="<path_to_executable>",
            action=DictAction, dest="exe_paths",
            help="configure which executable to use for the respective tool")

    args = parser.parse_args()

    exe_paths = {
        "yosys": os.getenv("YOSYS", "yosys"),
        "abc": os.getenv("ABC", "yosys-abc"),
        "smtbmc": os.getenv("SMTBMC", "yosys-smtbmc"),
        "suprove": os.getenv("SUPROVE", "suprove"),
        "aigbmc": os.getenv("AIGBMC", "aigbmc"),
        "avy": os.getenv("AVY", "avy"),
        "btormc": os.getenv("BTORMC", "btormc"),
        "pono": os.getenv("PONO", "pono"),
    }

    for k, v in args.exe_paths.items():
        exe_paths[k] = v

    args.exe_paths = exe_paths

    if args.init_config_file is not None:
        assert args.eqyfile is None
        assert len(args.init_config_file) == 4
        with open(args.init_config_file[0], 'w') as config:
            config.write("""[options]

[gold]
read -sv {2}
prep -top {1}

[gate]
read -sv {3}
prep -top {1}

[strategy simple]
use satseq
depth 10
""".format(*args.init_config_file))
        print("eqy template config written to '{}'.".format(args.init_config_file[0]), file=sys.stderr)
        sys.exit(0)

    return args

def read_config(configfile):
    if configfile is None:
        exit_with_error("No config file given")

    cfg = types.SimpleNamespace()
    simple_sections = ["options", "gold", "gate"]
    pattern_sections = ["recode", "match", "collect", "partition"]
    named_sections = ["strategy"]
    # TODO: properly initialize options according to meaning
    # how about adding sections only as headers are encountered, so that we can check for existence?
    for s in simple_sections + pattern_sections:
        setattr(cfg, s, list())
    for s in named_sections:
        setattr(cfg, s, dict())

    cfg.options = types.SimpleNamespace()
    cfg.options.splitnets = False
    cfg.options.insbuf = True

    section = None
    sectionarg = None
    match_default = True
    linenr = 0
    for line in configfile:
        linenr += 1

        # take this out if we want to do --pycode--
        line = line.strip()

        # can we PLEASE have a comment character
        if line == "" or line.startswith('#'):
            continue

        match = re.match(r"^\[(.*)\]\s*$", line)
        if match:
            entries = match.group(1).split()
            if len(entries) == 1 and entries[0] in simple_sections:
                section, sectionarg = entries[0], None
                continue
            if len(entries) == (3 if entries[0] == "recode" else 2) and entries[0] in pattern_sections:
                if entries[0] == "recode":
                    section, sectionarg = (entries[0], (entries[1], entries[2]))
                else:
                    section, sectionarg = entries
                continue
            if len(entries) == 2 and entries[0] in named_sections:
                section, sectionarg = entries
                if sectionarg not in getattr(cfg, section):
                    getattr(cfg, section)[sectionarg] = list()
                else:
                    exit_with_error(f"duplicated {section} section '{sectionarg}' in {configfile.name} line {linenr}")
                continue

        else:
            if section == "match" and line == "nodefault":
                match_default = False
                continue

            if section == "options":
                fields = line.split()
                if len(fields) != 2:
                    exit_with_error(f"syntax error in {section} section in {configfile.name} line {linenr}: {line}")
                if not hasattr(cfg.options, fields[0]):
                    exit_with_error(f"unknown option '{fields[0]}' in {configfile.name} line {linenr}: {line}")
                if type(getattr(cfg.options, fields[0])) is bool and fields[1] in ("on", "off"):
                    setattr(cfg.options, fields[0], fields[1] == "on")
                    continue
                exit_with_error(f"syntax error in {section} section in {configfile.name} line {linenr}: {line}")

            if section in simple_sections:
                getattr(cfg, section).append(line)
                continue

            if section in pattern_sections:
                getattr(cfg, section).append((sectionarg, line))
                continue

            if section in named_sections:
                getattr(cfg, section)[sectionarg].append(line)
                continue

        exit_with_error(f"syntax error in {configfile.name} line {linenr}")

    if match_default:
        cfg.match.append(("*", "gold-match *"))

    return cfg



def setup_workdir(args):
    name = ""
    if not args.workdir:
        if args.eqyfile.name != "<stdin>":
            name = os.path.splitext(os.path.basename(args.eqyfile.name))[0]
            name = re.sub(r'\W+', '', name)

    if args.tmpdir:
        if args.workdir:
            exit_with_error("Cannot use -d with -t")
        args.workdir = tempfile.mkdtemp()
    elif not args.workdir and name == "":
            print("Cannot derive workdir name from config file name. Using temporary directory.")
            args.workdir = tempfile.mkdtemp()
    else:
        if not args.workdir:
            args.workdir = name
        if os.path.exists(args.workdir):
            if args.backup:
                backup_idx = 0
                while os.path.exists("{}.bak{:03d}".format(args.workdir, backup_idx)):
                    backup_idx += 1
                shutil.move(args.workdir, "{}.bak{:03d}".format(args.workdir, backup_idx))
            if args.force:
                shutil.rmtree(args.workdir, ignore_errors=True)
        if args.cont:
            if not os.path.exists(args.workdir):
                exit_with_error("Cannot continue in '{}': no such directory".format(args.workdir))
            if not os.path.isdir(args.workdir):
                exit_with_error("Cannot continue in '{}': not a directory".format(args.workdir))
        else:
            if os.path.exists(args.workdir):
                exit_with_error("Directory '{}' already exists".format(args.workdir))
            os.makedirs(args.workdir)

        for f in "PASS FAIL UNKNOWN ERROR TIMEOUT status".split():
            if os.path.exists(args.workdir + "/" + f):
                os.remove(args.workdir + "/" + f)

def build_gate_gold(args, cfg, job):
    with open(args.workdir + "/gold.ys", "w") as f:
        for line in cfg.gold:
            print(line, file=f)
        if cfg.options.splitnets:
            print("splitnets -ports", file=f)
        print("opt_clean", file=f)
        print("check -initdrv", file=f)
        print("setundef -undriven -undef", file=f)
        print("write_ilang {}/gold.il".format(args.workdir), file=f)
    with open(args.workdir + "/gate.ys", "w") as f:
        for line in cfg.gate:
            print(line, file=f)
        if cfg.options.splitnets:
            print("splitnets -ports", file=f)
        print("opt_clean", file=f)
        print("check -initdrv", file=f)
        print("setundef -undriven -undef", file=f)
        print("write_ilang {}/gate.il".format(args.workdir), file=f)

    gold_task = EqyTask(job, "read_gold", [], "{yosys}{gopt} -ql {workdir}/gold.log {workdir}/gold.ys".format(
            yosys=args.exe_paths["yosys"], gopt=" -g" if args.debugmode else "", workdir=args.workdir))
    gold_task.checkretcode = True

    gate_task = EqyTask(job, "read_gate", [], "{yosys}{gopt} -ql {workdir}/gate.log {workdir}/gate.ys".format(
            yosys=args.exe_paths["yosys"], gopt=" -g" if args.debugmode else "", workdir=args.workdir))
    gate_task.checkretcode = True

    job.run()
    if (job.status == "ERROR"):
        exit_with_error("Reading sources failed.")

def build_combined(args, cfg, job):
    plugin_path = root_path() + '/../share/yosys/plugins' # for install
    if (not os.path.exists(plugin_path)):
        plugin_path = root_path() # for development
    with open(args.workdir + "/combine.ys", "w") as f:
        print("plugin -i {}/eqy_combine.so".format(plugin_path), file=f)
        print("read_ilang {}/gold.il".format(args.workdir), file=f)
        print("uniquify", file=f)
        print("hierarchy", file=f)
        print("design -stash gold", file=f)
        print("read_ilang {}/gate.il".format(args.workdir), file=f)
        print("uniquify", file=f)
        print("hierarchy", file=f)
        print("design -stash gate", file=f)
        print("{dbg}eqy_combine -gold_ids {wd}/gold.ids -gate_ids {wd}/gate.ids".format(dbg="debug " if args.debugmode else "", wd=args.workdir), file=f)
        print("write_ilang {}/combined.il".format(args.workdir), file=f)

    combine_task = EqyTask(job, "combine", [], "{yosys}{gopt} -ql {workdir}/combine.log {workdir}/combine.ys".format(
            yosys=args.exe_paths["yosys"], gopt=" -g" if args.debugmode else "", workdir=args.workdir))

    def check_retcode(retcode):
        if (retcode != 0):
            exit_with_error(f"Failed to combine designs. For details see '{args.workdir}/combine.log'.")
    combine_task.exit_callback = check_retcode

    job.run()

def read_ids(filename):
    ids = collections.defaultdict(dict)
    with open(filename) as f:
        for lineno, line in enumerate(f):
            line = shlex.split(line)
            if len(line) == 0 or line[0].startswith("#"):
                continue
            if len(line) < 3:
                exit_with_error("Syntax error in line {}".format(lineno))

            modname = line[0]
            objname = line[1]
            opts = line[2:]

            ids[modname][objname] = dict()

            for opt in opts:
                if "=" in opt:
                    optkey, optval = opt.split("=", maxsplit=1)
                else:
                    optkey, optval = opt, None

                if optkey in ("N"):
                    if optkey not in ids[modname][objname]:
                        ids[modname][objname][optkey] = list()
                    ids[modname][objname][optkey].append(optval)
                    continue

                if optkey.startswith("A:") or optkey in ("c", "w", "P"):
                    ids[modname][objname][optkey] = optval
                    continue

                exit_with_error("Invalid option {} in line {}".format(optkey, lineno))

            if 'w' not in ids[modname][objname] and 'c' not in ids[modname][objname] and objname != ".":
                exit_with_error("Missing type in line {}".format(lineno))
    return ids

class Pattern:
    repl_re = re.compile(r"\\([0-9]+)|\\g<([^>]+)>")
    pattern_re = re.compile(r"(/(?:[^/]|\\/)+/i?|(?:[a-zA-Z0-9_.*?]|\\.|\[[^\]]+\])+),?")

    def __init__(self, pattern, groups, groupdict):
        def repl(match):
            if match[1] is not None:
                return re.escape(groups[int(match[1])])
            if match[2] is not None:
                return re.escape(groupdict[match[2]])
            assert False

        self.direct = self.repl_re.sub(repl, pattern)
        plist = self.pattern_re.split(self.direct)
        if  "".join(plist[0::2]) != "":
            details = []
            for i, t in enumerate(plist):
                details.append("\n  '{}'  (expected {})".format(t, "''" if i%2 == 0 else "pattern"))
            exit_with_error("Parser error in pattern '{}': {}".format(pattern, "".join(details)))

        self.patterns = list()
        for pattern in plist[1::2]:
            p = types.SimpleNamespace()
            if pattern.startswith("/"):
                p.type = "regex"
                if pattern.endswith("/i"):
                    p.regex = re.compile(pattern[1:-2], re.I)
                else:
                    assert pattern.endswith("/")
                    p.regex = re.compile(pattern[1:-1], re.I)
            else:
                p.type = "shell"
                p.expr = pattern
            self.patterns.append(p)


    def match(self, name, metadata):
        for p in self.patterns:
            # TBD: Attribute Patterns
            # TBD: Partition Patterns
            if p.type == "regex":
                if m := p.regex.search(name):
                    groups = [m.group()] + list(m.groups())
                    groupdict = m.groupdict()
                    return (name, groups, groupdict)
                continue
            if p.type == "shell":
                if fnmatch.fnmatch(name, p.expr):
                    return (name, [name], {})
                continue
            assert False
        return None

    def search(self, ids):
        if self.direct in ids:
            return [(self.direct, [self.direct], {})]

        results = list()
        for name, metadata in ids.items():
            if name == ".":
                continue
            if (m := self.match(name, metadata)) is not None:
                results.append(m)
        return results

def search_modules(job, ids, expr, excl=set()):
    matches = []
    pattern = Pattern(expr, [], {})
    for key in ids:
        if pattern.match(key, {}):
            if key not in excl: matches.append(key)
    return matches

def search_entities(job, ids, other_ids, expr, other_expr, excl=set(), other_excl=set()):
    matches = []
    found_first = False
    found_second = other_ids is None
    lhs = Pattern(expr, [], {})

    for name, groups, groupdict in lhs.search(ids):
        found_first = True
        if other_expr is None:
            if other_ids is None or name in other_ids:
                if name not in excl and name not in other_excl: matches.append((name, name))
                found_second = True
        else:
            rhs = Pattern(other_expr, groups, groupdict)
            for other_name, _, _ in rhs.search(other_ids):
                if name not in excl and other_name not in other_excl: matches.append((name, other_name))
                found_second = True

    if not found_first:
        if other_expr is None:
            job.warning(f"Cannot find entity {expr}.")
        else:
            job.warning(f"Cannot find first entity in {expr} {other_expr}.")
    if not found_second:
        job.warning(f"Cannot find second entity in {expr} {other_expr}.")

    return matches

def match_ids(args, cfg, job):
    cfg.matched_ids = collections.defaultdict(dict)
    used_gold_ids = collections.defaultdict(set)
    used_gate_ids = collections.defaultdict(set)
    with open(args.workdir + "/matched.ids", 'w') as f:
        for pattern, line in cfg.match:
            line = line.split()
            if len(line) == 0:
                continue
            match_counter = 0
            print(f"# [{pattern}] {' '.join(line)}", file=f)
            if line[0] == "gold-match" and len(line) in [2, 3]:
                for module_match in search_modules(job, cfg.gold_ids, pattern):
                    if module_match in cfg.gate_ids: #TODO: is this the right way to deal with missing module hierarchy?
                        for entity_match in search_entities(job, cfg.gold_ids[module_match], cfg.gate_ids[module_match],
                                                            line[1], line[2] if len(line) == 3 else None,
                                                            used_gold_ids[module_match], used_gate_ids[module_match]):
                            match_counter += 1
                            print(module_match, entity_match[0], entity_match[1], file=f)
                            cfg.matched_ids[module_match][entity_match[0]] = cfg.gold_ids[module_match][entity_match[0]]
                            used_gold_ids[module_match].add(entity_match[0])
                            used_gate_ids[module_match].add(entity_match[1])
            elif line[0] == "gate-match" and len(line) in [2, 3]:
                for module_match in search_modules(job, cfg.gate_ids, pattern):
                    if module_match in cfg.gold_ids:
                        for entity_match in search_entities(job, cfg.gate_ids[module_match], cfg.gold_ids[module_match],
                                                            line[1], line[2] if len(line) == 3 else None,
                                                            used_gate_ids[module_match], used_gold_ids[module_match]):
                            match_counter += 1
                            print(module_match, entity_match[1], entity_match[0], file=f)
                            cfg.matched_ids[module_match][entity_match[1]] = cfg.gold_ids[module_match][entity_match[1]]
                            used_gate_ids[module_match].add(entity_match[0])
                            used_gold_ids[module_match].add(entity_match[1])
            elif line[0] == "gold-nomatch" and len(line) == 2:
                for module_match in search_modules(job, cfg.gold_ids, pattern):
                    for entity_match in search_entities(job, cfg.gold_ids[module_match], None, line[1], None, used_gold_ids[module_match]):
                        match_counter += 1
                        used_gold_ids[module_match].add(entity_match[0])
            elif line[0] == "gate-nomatch" and len(line) == 2:
                for module_match in search_modules(job, cfg.gate_ids, pattern):
                    for entity_match in search_entities(job, cfg.gate_ids[module_match], None, line[1], None, used_gate_ids[module_match]):
                        match_counter += 1
                        used_gate_ids[module_match].add(entity_match[0])
            else:
                exit_with_error(f"Syntax error in match command \"{' '.join(line)}\"")

            if args.debugmode:
                job.log(f"Matched {match_counter} nets: [{pattern}] {' '.join(line)}")

def partition_ids(args, cfg, job):
    no_database = {
        "bind": set(), "join": set(), "solo": set(), "group": set(),
        "sticky": set(), "merge": set(), "name": set(), "final": set(), "amend": set()
    }

    with open(args.workdir + "/partition.ids", "w") as partids_f:
        for pattern, line in cfg.collect:
            line = line.split()

            if line[0] in ("nobind", "nojoin", "nogroup", "nosolo") and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0][2:]]):
                        no_database[line[0][2:]].add((module_match, entity_match))
                continue

            if line[0] in ("bind", "join", "solo") and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0]]):
                        print(line[0], module_match, entity_match, file=partids_f)
                continue

            if line[0] in ("group", "solo-group") and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    first_entity = None
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database["group"]):
                        if line[0] == "solo-group":
                            if (module_match, entity_match) in no_database["solo"]:
                                continue
                            print("solo", module_match, entity_match, file=partids_f)
                        if first_entity is None:
                            first_entity = entity_match
                        else:
                            print("group", module_match, first_entity, entity_match, file=partids_f)
                continue

            if line[0] == "group" and len(line) == 3:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    first_entity = None
                    previous_entities = set()
                    for entity_match in search_entities(job, cfg.matched_ids[module_match], cfg.matched_ids[module_match],
                                                        line[1], line[2], no_database[line[0]], no_database[line[0]]):
                        for entity in entity_match:
                            if first_entity is None:
                                first_entity = entity
                            elif entity not in previous_entities:
                                print(line[0], module_match, first_entity, entity, file=partids_f)
                            previous_entities.add(entity)
                continue

            exit_with_error(f"Syntax error in collect command \"{' '.join(line)}\"")

        for pattern, line in cfg.partition:
            line = line.split()

            if line[0] in ("nosticky", "nomerge", "noname", "noamend") and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0][2:]]):
                        no_database[line[0][2:]].add((module_match, entity_match))
                        if line[0] == "noamend":
                            print(line[0], module_match, entity_match, file=partids_f)
                continue

            if line[0] in ("sticky", "final", "amend") and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0]]):
                        print(line[0], module_match, entity_match, file=partids_f)
                continue

            if line[0] == "name" and len(line) == 3:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0]]):
                        print(line[0], module_match, entity_match, line[2], file=partids_f)
                continue

            if line[0] == "merge" and len(line) == 2:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    first_entity = None
                    for entity_match, _ in search_entities(job, cfg.matched_ids[module_match], None, line[1], None, no_database[line[0]]):
                        if first_entity is None:
                            first_entity = entity_match
                        else:
                            print(line[0], module_match, first_entity, entity_match, file=partids_f)
                continue

            if line[0] == "merge" and len(line) == 3:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    first_entity = None
                    previous_entities = set()
                    for entity_match in search_entities(job, cfg.matched_ids[module_match], cfg.matched_ids[module_match],
                                                        line[1], line[2], no_database[line[0]], no_database[line[0]]):
                        for entity in entity_match:
                            if first_entity is None:
                                first_entity = entity
                            elif entity not in previous_entities:
                                print(line[0], module_match, first_entity, entity, file=partids_f)
                            previous_entities.add(entity)
                continue

            if line[0] in ("path", "amend") and len(line) == 3:
                for module_match in search_modules(job, cfg.matched_ids, pattern):
                    for entity_match in search_entities(job, cfg.matched_ids[module_match], cfg.matched_ids[module_match],
                                                        line[1], line[2], no_database[line[0]], no_database[line[0]]):
                        print(line[0], module_match, entity_match[0], entity_match[1], file=partids_f)
                continue

            exit_with_error(f"Syntax error in partition command \"{' '.join(line)}\"")

def make_partitions(args, cfg, job):
    partition_ids(args, cfg, job)
    plugin_path = root_path() + '/../share/yosys/plugins' # for install
    if (not os.path.exists(plugin_path)):
        plugin_path = root_path() # for development
    with open(args.workdir + "/partition.ys", "w") as f:
        print("plugin -i {}/eqy_partition.so".format(plugin_path), file=f)
        print("read_ilang combined.il".format(args.workdir), file=f)
        if cfg.options.insbuf:
            print("insbuf", file=f)
        print("{dbg}eqy_partition -matched_ids matched.ids -partition_ids partition.ids -create_partition_list partition.list".format(dbg="debug " if args.debugmode else ""), file=f)
    if not os.path.isdir(args.workdir + "/partitions"):
        os.mkdir(args.workdir + "/partitions")

    partition_task = EqyTask(job, "partition", [], "cd {workdir}; {yosys} -ql partition.log partition.ys".format(yosys=args.exe_paths["yosys"], workdir=args.workdir))
    def check_retcode(retcode):
        if (retcode != 0):
            exit_with_error(f"Failed to partition design. For details see '{args.workdir}/partition.log'.")
    partition_task.exit_callback = check_retcode

    job.run()

def recode_ids(args, cfg, job):
    with open(args.workdir + "/recode.ids", 'w') as f:
        for pattern, line in cfg.recode:
            line = line.split()
            if len(line) == 0:
                continue
            if len(line) in [2]:
                for module_match in match_module_re(cfg.gold_ids, pattern[0]):
                    if module_match in cfg.gate_ids:
                        for entity_match, _ in match_entity_re(cfg.matched_ids[module_match], cfg.gate_ids[module_match], pattern[1], None):
                            print(module_match, entity_match, line[0], line[1], file=f)
                    else:
                        exit_with_error(f"Module '{module_match}' must exist in gate design.")
            else:
                exit_with_error(f"Syntax error in match command \"{' '.join(line)}\"")

class EqyStrategy:
    default_scfg = {}

    def __init__(self, args, cfg, name):
        self.args, self.cfg, self.name = args, cfg, name
        self.parse()
        self.check_scfg()

    def parse(self):
        self.scfg = types.SimpleNamespace(**self.default_scfg)
        self.options_seen = set()
        for input_line in self.cfg.strategy[self.name]:
            input_line = input_line.strip()
            line = input_line.split(None, 1)
            if len(line) == 1:
                line.append(None)
            error_msg = getattr(self, f"parse_opt_{line[0]}", self.parse_other_option)(*line)
            if error_msg:
                exit_with_error(f"Error parsing strategy config line '{input_line}' in strategy '{self.name}': {error_msg}")

    def check_scfg(self):
        pass

    def parse_opt_use(self, name, value):
        if name in self.options_seen:
            return "repeated option"
        self.options_seen.add(name)

    def parse_other_option(self, name, value):
        return f"unknown option '{name}'"

    def int_opt_parser(self, name, value):
        if name in self.options_seen:
            return "repeated option"
        self.options_seen.add(name)
        if value is None:
            return "expected option value"
        try:
            setattr(self.scfg, name, int(value))
        except ValueError:
            return "expected integer option"

    def string_opt_parser(self, name, value):
        if name in self.options_seen:
            return "repeated option"
        self.options_seen.add(name)
        if value is None:
            return "expected option value"
        setattr(self.scfg, name, value)

    def bool_opt_parser(self, name, value):
        if name in self.options_seen:
            return "repeated option"
        self.options_seen.add(name)
        if value is None:
            return "expected option value"
        if value not in ("on", "off"):
            return "expected one of 'on', 'off'"
        setattr(self.scfg, name, value == "on")

    @staticmethod
    def make_enum_parser(values):
        def enum_parser(self, name, value):
            if name in self.options_seen:
                return "repeated option"
            self.options_seen.add(name)
            if value is None:
                return "expected option value"
            if value not in values:
                return "expected one of " + ', '.join(map(repr, values))
            setattr(self.scfg, name, value)
        return enum_parser

    def partition_supported(self, job, partition):
        return True

    def write(self, job, partition):
        raise NotImplemented("EqyStrategy.write not implemented")

    def path(self, partition, suffix):
        return f"{self.args.workdir}/strategies/{partition}/{self.name}/{suffix}"


class EqyDummyStrategy(EqyStrategy):
    def write(self, job, partition):
        with open(self.path(partition.name, "run.sh"), "w") as run_f:
            print("echo UNKNOWN > status", file=run_f)
            print(f"echo \"Setting unknown status for partition '{partition.name}' via dummy strategy '{self.name}'\"", file=run_f)


class EqySatseqStrategy(EqyStrategy):
    default_scfg = dict(depth=5)
    parse_opt_depth = EqyStrategy.int_opt_parser

    def partition_supported(self, job, partition):
        if 'memory' in partition.attributes:
            job.log(f"Skipping strategy '{self.name}' for partition '{partition.name}' as it contains memory.")
            return False
        return True

    def write(self, job, partition):
        with open(self.path(partition.name, "run.sh"), "w") as run_f:
            print(textwrap.dedent(f"""
                yosys -ql run.log run.ys
                if grep "SAT temporal induction proof finished - model found for base case: FAIL!" run.log > /dev/null ; then
                \techo FAIL > status
                \techo "Could not prove equivalence of partition '{partition.name}' using strategy '{self.name}'"
                elif grep "Reached maximum number of time steps -> proof failed." run.log > /dev/null ; then
                \techo UNKNOWN > status
                \techo "Could not prove equivalence of partition '{partition.name}' using strategy '{self.name}'"
                elif grep "Induction step proven: SUCCESS!" run.log > /dev/null ; then
                \techo PASS > status
                \techo "Proved equivalence of partition '{partition.name}' using strategy '{self.name}'"
                else
                \techo ERROR > status
                \techo "Execution of strategy '{self.name}' on partition '{partition.name}' encountered an error.
                Details can be found in '{self.args.workdir}/strategies/{partition.name}/{self.name}/run.log'."
                \texit 1
                fi
                exit 0
            """[1:-1]), file=run_f)

        with open(self.path(partition.name, "run.ys"), "w") as ys_f:
            print(f"read_ilang ../../../partitions/{partition.name}.il", file=ys_f)
            print(f"miter -equiv -cross -make_assert -ignore_gold_x -flatten gold.{partition.name} gate.{partition.name} miter", file=ys_f)
            print(f"sat -tempinduct -set-init-undef -set-def-inputs -maxsteps {self.scfg.depth} -prove-asserts -show-public -dump_vcd trace.vcd miter", file=ys_f)


class EqySbyStrategy(EqyStrategy):
    default_scfg = dict(engine='smtbmc', depth=5)
    parse_opt_engine = EqyStrategy.string_opt_parser
    parse_opt_depth = EqyStrategy.int_opt_parser

    def write(self, job, partition):
        with open(self.path(partition.name, f"{partition.name}.sby"), "w") as sby_f:
            print(textwrap.dedent(f"""
                [options]
                mode prove
                depth {self.scfg.depth}
                expect pass,fail,unknown

                [engines]
                {self.scfg.engine}

                [script]
                read_ilang {partition.name}.il
                miter -equiv -cross -make_assert -flatten gold.{partition.name} gate.{partition.name} miter
                hierarchy -top miter

                [files]
                ../../../partitions/{partition.name}.il
            """[1:-1]), file=sby_f)

        with open(self.path(partition.name, "run.sh"), "w") as run_f:
            print(textwrap.dedent(f"""
                STATUS=ERROR
                sby -f {partition.name}.sby > /dev/null && STATUS=$(awk '{{print $1}}' {partition.name}/status)
                echo $STATUS > status
                case $STATUS in
                    PASS)
                        echo "Proved equivalence of partition '{partition.name}' using strategy '{self.name}'"
                    ;;
                    FAIL)
                        echo "Could not prove equivalence of partition '{partition.name}' using strategy '{self.name}': partitions not equivalent"
                    ;;
                    UNKNOWN)
                        echo "Could not prove equivalence of partition '{partition.name}' using strategy '{self.name}': equivalence unknown"
                    ;;
                    *)
                        cat {partition.name}/ERROR 2> /dev/null
                        echo "Execution of strategy '{self.name}' on partition '{partition.name}' encountered an error."
                        echo "More details can be found in '{self.path(partition.name, f'{partition.name}/logfile.txt')}'."
                        exit 1
                    ;;
                esac
                exit 0
            """[1:-1]), file=run_f)


strategy_types = {
    "dummy": EqyDummyStrategy,
    "satseq": EqySatseqStrategy,
    "sby": EqySbyStrategy,
    # add strategies here
}

def parse_strategies(args, cfg):
    strategies = {}
    for strategy_name in cfg.strategy:
        strategy_type = None
        for line in cfg.strategy[strategy_name]:
            line = line.strip().split()
            if len(line) > 1 and line[0] == "use":
                strategy_type = line[1]
                break
        if strategy_type is None:
            exit_with_error(f"Strategy '{strategy_name}' has no 'use' line.")
        if strategy_type not in strategy_types:
            exit_with_error(f"Unknown strategy type '{strategy_type}' for strategy '{strategy_name}'.")
        strategies[strategy_name] = strategy_types[strategy_type](args, cfg, strategy_name)

    return strategies


class EqyPartition:
    net_index_re = re.compile(r"^(.*)\[(\d+)\]$")

    def __init__(self, line, args, cfg, job):
        fields = iter(line.split())
        self.module = next(fields)
        self.name = next(fields)

        self.attributes = set()
        for item in fields:
            if item == ':':
                break
            self.attributes.add(item)

        with open(f"{args.workdir}/partitions/{self.name}.json", "r") as f:
            for key, value in json.load(f).items():
                if key in ("gold_module", "gate_module"):
                    setattr(self, key, types.SimpleNamespace(**value))
                else:
                    setattr(self, key, value)

        if self.gold_module.unused:
            job.warning(f"Partition {self.name} contains {len(self.gold_module.unused)} unused gold inputs.")

        if self.gate_module.unused:
            job.warning(f"Partition {self.name} contains {len(self.gate_module.unused)} unused gate inputs.")

def make_scripts(args, cfg, job, strategies):
    partitions = []

    with open(args.workdir + "/partition.list") as f:
        for line in f:
            partitions.append(EqyPartition(line, args, cfg, job))

    if not os.path.isdir(args.workdir + "/strategies"):
        os.mkdir(args.workdir + "/strategies")

    with open(f"{args.workdir}/strategies.mk", "w") as make_f:
        print(".DEFAULT_GOAL := all\n", file=make_f)
        targets = []
        for partition in partitions:
            if not os.path.isdir(f"{args.workdir}/strategies/{partition.name}"):
                os.mkdir(f"{args.workdir}/strategies/{partition.name}")
            prev_strategy = None
            for strategy_name in cfg.strategy:
                # TODO: ensure unchanged strategies don't get re-run but changed strategies do

                strategy = strategies[strategy_name]
                if not strategy.partition_supported(job, partition):
                    continue
                if not os.path.isdir(f"{args.workdir}/strategies/{partition.name}/{strategy.name}"):
                    os.mkdir(f"{args.workdir}/strategies/{partition.name}/{strategy.name}")
                strategy.write(job, partition)

                if prev_strategy:
                    print(f"""strategies/{partition.name}/{strategy.name}/status: {prev_strategy}
\t@if grep PASS $^ >/dev/null ; then \\
\t\techo "PASS (cached)" > $@; \\
\telif grep FAIL $^ >/dev/null ; then \\
\t\techo "FAIL (cached)" > $@; \\
\telse \\
\t\techo \"Running strategy '{strategy.name}' on '{partition.name}'..\"; \\
\t\tbash -c \"cd strategies/{partition.name}/{strategy.name}; source run.sh\"; \\
\tfi\n""" , file=make_f)
                else:
                    print(f"strategies/{partition.name}/{strategy.name}/status:", file=make_f)
                    print(f"\t@echo \"Running strategy '{strategy.name}' on '{partition.name}'..\"", file=make_f)
                    print(f"\t@bash -c \"cd strategies/{partition.name}/{strategy.name}; source run.sh\"\n", file=make_f)
                prev_strategy = f"strategies/{partition.name}/{strategy.name}/status"
            if prev_strategy is None:
                exit_with_error(f"No configured strategy supports partition {partition.name}")
            targets.append(prev_strategy)

        print(f".PHONY: all", file=make_f)
        print(f"all: {' '.join(targets)}", file=make_f)
        print( f"""\t@rc=0 ; \\
\tfor f in {' '.join(targets)} ; do \\
\t\tif ! grep -q "PASS" $$f ; then \\
\t\t\tp=$${{f#strategies/}} ; \\
\t\t\tp=$${{p%/*/status}} ; \\
\t\t\techo "* Failed to prove equivalence of partition $$p" ; \\
\t\t\trc=1 ; \\
\t\tfi ; \\
\tdone ; \\
\tif [ "$$rc" -eq 0 ] ; then \\
\t\techo "* Successfully proved designs equivalent" ; \\
\tfi""", file=make_f)

def run_scripts(args, cfg, job):
    kopt = " -k" if args.keep_going else ""
    jopt = f" -j{args.num_jobs}" if args.num_jobs else ""
    run_task = EqyTask(job, "run", [], f"make{kopt}{jopt} -C {args.workdir} -f strategies.mk")
    failing_partitions_count = 0
    summary_messages = list()

    def check_output(line):
        nonlocal failing_partitions_count
        if line.startswith("* "):
            match = re.match(r"^\* Failed to prove equivalence", line)
            if match:
                job.update_status("FAIL")
                summary_messages.append(click.style(line[2:], fg="red", bold=True))
                failing_partitions_count += 1
            else:
                match = re.match(r"^\* Successfully proved designs equivalent", line)
                if match:
                    job.update_status("PASS")
                    summary_messages.append(click.style(line[2:], fg="green", bold=True))
                else:
                    summary_messages.append(click.style(line[2:], bold=true))
            return None
        return line

    def check_retcode(retcode):
        if (retcode != 0):
            exit_with_error(f"A problem occurred during equivalence check.")

    run_task.output_callback = check_output
    run_task.exit_callback = check_retcode
    job.run()

    if failing_partitions_count:
        job.warning(f"Failed to prove equivalence for {failing_partitions_count} partitions:")
    for line in summary_messages:
        job.log(line)

def validate_config(args, cfg):
    mandatory_cfg_sections = ["gold", "gate"]
    for s in mandatory_cfg_sections:
        if len(getattr(cfg, s)) == 0:
            exit_with_error("section [{}] missing".format(s))

def main():
    args = parse_args()
    cfg = read_config(args.eqyfile)

    if args.debugmode:
        print("args =", args)
        print("cfg =", cfg)

    validate_config(args, cfg)
    strategies = parse_strategies(args, cfg)
    setup_workdir(args)

    job = EqyJob(args, cfg, [])

    if args.purgelist is not None:
        for pattern in args.purgelist:
            for path in glob.glob(f"{args.workdir}/strategies/{pattern}/status"):
                job.log(f"Removing '{path}'.")
                os.remove(path)

    build_gate_gold(args, cfg, job)
    build_combined(args, cfg, job)

    cfg.gold_ids = read_ids(args.workdir + "/gold.ids")
    cfg.gate_ids = read_ids(args.workdir + "/gate.ids")

    if args.debugmode:
        gold_id_count = sum([len(cfg.gold_ids[n]) for n in cfg.gold_ids])
        gate_id_count = sum([len(cfg.gate_ids[n]) for n in cfg.gate_ids])
        job.log(f"Created ID database with {gold_id_count} gold ids and {gate_id_count} gate ids.")

    recode_ids(args, cfg, job)
    match_ids(args, cfg, job)
    make_partitions(args, cfg, job)
    make_scripts(args, cfg, job, strategies)

    if args.commands:
        ys_task_index = 0
        for command, partition in args.commands:
            command = command.replace("\\", "\\\\").replace("'", "\\'")
            def check_retcode_f(index):
                def check_retcode(retcode):
                    if (retcode != 0):
                        exit_with_error(f"Yosys task {index} returned a non-zero exit code.")
                return check_retcode
            for path in glob.glob(f"{args.workdir}/partitions/{partition}.il"):
                ys_task_index += 1
                run_task = EqyTask(job, f"yosys.{ys_task_index}", [], f"yosys -p '{command}' {path}")
                run_task.exit_callback = check_retcode_f(ys_task_index)
        job.run()

    elif not args.setupmode:
        run_scripts(args, cfg, job)

    job.final()

if __name__ == '__main__':
    main()
