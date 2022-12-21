help:
	@echo ""
	@echo "make test_gold.vcd"
	@echo "make test_gate.vcd"
	@echo "  run the testbench on either netlist"
	@echo ""

test_gold.vcd: test_gold
	vvp -N test_gold

test_gate.vcd: test_gate
	vvp -N test_gate

test_gold:
	iverilog -o test_gold -D GOLD testbench.v picorv32_modified.v

test_gate:
	iverilog -o test_gate testbench.v picorv32_vivado.v `yosys-config --datdir/xilinx/cells_sim.v`

vcdmatch: test_gold.vcd test_gate.vcd
	python3 vcdmatch.py > vcdmatch.out

clean:
	rm -f test_gold.vcd test_gate.vcd test_gold test_gate vcdmatch.out
