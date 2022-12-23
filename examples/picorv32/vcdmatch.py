#!/usr/bin/env python3

from vcdvcd import VCDVCD

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
                if "BUF" in name: continue
                if "dbg" in name: continue
                if name.startswith(self.currentTop):
                    name = name[len(self.currentTop):]
                    if name.startswith("\\"): name = name[1:]
                    break
            else:
                continue
            if self.currentDepth == 0 or self.currentDepth > name.count("."):
                name = self.currentPrefix + name
                self.references[key] = name
                if vcd.data[key].size == "1":
                    self.bitnames[name, 0] = name
                else:
                    for idx in range(int(vcd.data[key].size)):
                        self.bitnames[name, idx] = f"{name}<{idx}>"
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
            for idx, bit in enumerate(reversed(cur_sig_vals[key])):
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

        rootGroup = self.mk()
        for name in self.vcdData.refbits:
            if name not in self.vcdData.onebits: continue
            if name not in self.vcdData.zerobits: continue
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
                    elif bit == "x":
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

                group.zeros = set()
                group.ones = set()
                group.undefs = set()

            self.cleanup()

    def print(self):
        G = set()
        for idx, group in enumerate(self.groups):
            for name in sorted(group.members):
                if name.startswith("gold."):
                    n = "gate" + name[4:]
                    if n in group.members: break
            else:
                G.add(tuple(sorted(group.members)))
        print("Left with {len(G)} groups after sorting and filtering:")
        for idx, group in enumerate(sorted(G)):
            print(f"  Group {idx}:")
            for name in group:
                print(f"    {name}")

db = SignalDatabase()
db.parse("test_gold.vcd", "gold", "testbench.uut")
db.parse("test_gate.vcd", "gate", "testbench.uut")
db.process()
db.print()

