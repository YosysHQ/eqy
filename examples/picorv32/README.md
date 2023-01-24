# Using EQY to get a formally verified synthesis result from Xilinx Vivado

This directory contains an example project that demonstrates a methodology for
creating formally verified netlist using EQY and Xilinx Vivado. The example
design we are using is PicoRV32 in its default configuration, and the
architecture we are targetting is Kintex-7.

The file [picorv32.v](picorv32.v) contains the unmodified original PicoRV32
Verilog HDL code. From this we first created a functionally equivalent
[picorv32_modified.v](picorv32_modified.v) that eliminates some of the
X-propagation from the design. The EQY project [picorv32_modified.eqy](picorv32_modified.eqy)
proves equivalence for the two versions of the design:

```
$ eqy -j6 picorv32_modified.eqy
...
EQY 17:43:02 [picorv32_modified] Successfully proved designs equivalent
EQY 17:43:02 [picorv32_modified] summary: Elapsed clock time [H:MM:SS (secs)]: 0:00:16 (16)
EQY 17:43:02 [picorv32_modified] summary: Elapsed process time [H:MM:SS (secs)]: 0:00:49 (49)
EQY 17:43:02 [picorv32_modified] DONE (PASS, rc=0)
```

Next we synthesized that modified design with Xilinx Vivado with [picorv32_vivado.tcl](picorv32_vivado.tcl)
into the Verilog netlist [picorv32_vivado.v](picorv32_vivado.v). Equivalence of the synthesis output
with the modified design is proven via the EQY project [picorv32_vivado.eqy](picorv32_vivado.eqy):

```
$ eqy -j6 picorv32_vivado.eqy
...
EQY 17:50:43 [picorv32_vivado] Successfully proved designs equivalent
EQY 17:50:43 [picorv32_vivado] summary: Elapsed clock time [H:MM:SS (secs)]: 0:04:16 (256)
EQY 17:50:43 [picorv32_vivado] summary: Elapsed process time [H:MM:SS (secs)]: 0:21:52 (1312)
EQY 17:50:43 [picorv32_vivado] DONE (PASS, rc=0)
```

The following sections describe the techniques we employed to create the [picorv32_vivado.eqy](picorv32_vivado.eqy) file.

## Eliminating false matched points

TBD

## Finding additional matching points

TBD

## Generating partition amend-rules

TBD
