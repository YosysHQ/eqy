# Run with:
# bash -c ". /opt/Xilinx/Vivado/2021.2/settings64.sh; vivado -mode batch -nojournal -log picorv32_vivado.log -source picorv32_vivado.tcl"

set synth_opts "-verbose"
lappend synth_opts -part xc7k70t-fbg676
lappend synth_opts -max_bram 0
lappend synth_opts -max_uram 0
lappend synth_opts -max_dsp 0
lappend synth_opts -no_srlextract
lappend synth_opts -fsm_extraction off
lappend synth_opts -resource_sharing off
# lappend synth_opts -retiming

set opt_opts "-verbose"
lappend opt_opts -propconst
lappend opt_opts -merge_equivalent_drivers
# lappend opt_opts -remap
# lappend opt_opts -aggressive_remap
# lappend opt_opts -resynth_remap
# lappend opt_opts -resynth_area
# lappend opt_opts -resynth_seq_area
# lappend opt_opts -muxf_remap
# lappend opt_opts -control_set_merge

set write_opts "-force"
# lappend write_opts -include_xilinx_libs
# lappend write_opts -include_unisim
# lappend write_opts -mode funcsim

read_verilog picorv32_modified.v

synth_design -rtl -top picorv32
# set keep_nets [get_nets cpu_state[*]]
# set_property KEEP true $keep_nets
# set_property DONT_TOUCH true $keep_nets

synth_design {*}$synth_opts
opt_design {*}$opt_opts

report_utilization
report_timing

write_verilog {*}$write_opts picorv32_vivado.v
