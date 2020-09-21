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
import argparse, types, re
import os, sys, tempfile, shutil
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

    parser.add_argument("eqyfile", metavar="<config>.eqy", type=argparse.FileType('r'),
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

    parser.add_argument("-m", "--makefiles-only", action="store_true", dest="makefile_only",
            help="generate strategy makefiles and exit")
    parser.add_argument("--init-config-file", metavar=("<filename>", "<gold>", "<gate>"), nargs=3,
            help="create a default .eqy config in <filename> for source files <gold> and <gate>")
    parser.add_argument("--setup", action="store_true", dest="setupmode",
            help="set up the working directory and exit")

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
        assert len(args.init_config_file) == 3
        eqy_file = args.init_config_file[0]
        gold_file = args.init_config_file[1]

        gate_file = args.init_config_file[2]
        with open(eqy_file, 'w') as config:
            config.write("""[options]

[gold]
read -formal {0}
prep

[gate]
read -formal {1}
prep

[recode]

[match]

[partition]

[strategy *]
""".format(gold_file, gate_file))
        print("eqy config written to {}".format(eqy_file), file=sys.stderr)
        sys.exit(0)

    return args

def read_config(configfile):
    if configfile is None:
        exit_with_error("No config file given")

    cfg = types.SimpleNamespace()
    cfg_sections = ["options", "gold", "gate", "recode", "match", "partition"]
    named_sections = ["strategy"]
    # TODO: properly initialize options according to meaning
    # how about adding sections only as headers are encountered, so that we can check for existence?
    for s in cfg_sections:
        setattr(cfg, s, list())
    for s in named_sections:
        setattr(cfg, s, dict())

    section = None
    sectionarg = None
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
            if len(entries) == 1 and entries[0] in cfg_sections:
                section, sectionarg = entries[0], None
                continue
            if len(entries) == 2 and entries[0] in named_sections:
                section, sectionarg = entries
                if sectionarg not in getattr(cfg, section):
                    getattr(cfg, section)[sectionarg] = list()
                continue

        if section == "strategy":
            cfg.strategy[sectionarg].append(line)
            continue

        if section in cfg_sections:
            getattr(cfg, section).append(line)
            continue

        exit_with_error("syntax error in {} line {}".format(configfile.name, linenr))

    return cfg

def validate_config(args, cfg):
    mandatory_cfg_sections = ["gold", "gate"]
    for s in mandatory_cfg_sections:
        if len(getattr(cfg, s)) == 0:
            exit_with_error("section [{}] missing".format(s))


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
        print("write_ilang {}/gold.il".format(args.workdir), file=f)
    with open(args.workdir + "/gate.ys", "w") as f:
        for line in cfg.gate:
            print(line, file=f)
        print("write_ilang {}/gate.il".format(args.workdir), file=f)

    gold_task = EqyTask(job, "read_gold", [], "{yosys} -ql {workdir}/gold.log {workdir}/gold.ys".format(yosys=args.exe_paths["yosys"], workdir=args.workdir))
    gold_task.checkretcode = True
    gate_task = EqyTask(job, "read_gate", [], "{yosys} -ql {workdir}/gate.log {workdir}/gate.ys".format(yosys=args.exe_paths["yosys"], workdir=args.workdir))
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
        print("eqy_combine -gold_ids {wd}/gold.ids -gate_ids {wd}/gate.ids".format(wd=args.workdir), file=f)
        print("write_ilang {}/combined.il".format(args.workdir), file=f)

    combine_task = EqyTask(job, "combine", [], "{yosys} -ql {workdir}/combine.log {workdir}/combine.ys".format(yosys=args.exe_paths["yosys"], workdir=args.workdir))

    job.run()

def make_partitions(args, cfg, job):
    plugin_path = root_path() + '/../share/yosys/plugins' # for install
    if (not os.path.exists(plugin_path)):
        plugin_path = root_path() # for development
    with open(args.workdir + "/partition.ys", "w") as f:
        print("plugin -i {}/eqy_partition.so".format(plugin_path), file=f)
        print("read_ilang combined.il".format(args.workdir), file=f)
        print("eqy_partition", file=f)
    if not os.path.isdir(args.workdir + "/partitions"):
        os.mkdir(args.workdir + "/partitions")

    partition_task = EqyTask(job, "partition", [], "cd {workdir}; {yosys} -ql partition.log partition.ys".format(yosys=args.exe_paths["yosys"], workdir=args.workdir))

    job.run()

def main():
    args = parse_args()
    cfg = read_config(args.eqyfile)
    validate_config(args, cfg)
    setup_workdir(args)
    if (args.setupmode):
        exit(0)
    print("args =", args)
    print("cfg =", cfg)
    job = EqyJob(args, cfg, [])
    build_gate_gold(args, cfg, job)
    build_combined(args, cfg, job)
    make_partitions(args, cfg, job)

if __name__ == '__main__':
    main()
