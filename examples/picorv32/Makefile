help:
	@echo ""
	@echo "make prove_vivado"
	@echo "make prove_modified"
	@echo "  run the formal equivalence proofs"
	@echo ""
	@echo "make vcdmatch"
	@echo "  re-generate vcdmatch.out"
	@echo ""
	@echo "make vivado"
	@echo "  re-run vivado synthesis"
	@echo ""
	@echo "make clean"
	@echo "  remove temporary output files"
	@echo ""

prove_vivado: picorv32_vivado.eqy picorv32_vivado.v picorv32_modified.v
	eqy -fj6 picorv32_vivado.eqy

prove_modified: picorv32_modified.eqy picorv32_modified.v picorv32.v
	eqy -fj6 picorv32_modified.eqy

test_gold.vcd: test_gold
	vvp -N test_gold

test_gate.vcd: test_gate
	vvp -N test_gate

test_gold: testbench.v picorv32_modified.v
	iverilog -o test_gold -D GOLD testbench.v picorv32_modified.v

test_gate:testbench.v picorv32_vivado.v
	iverilog -o test_gate testbench.v picorv32_vivado.v `yosys-config --datdir/xilinx/cells_sim.v`

vcdmatch: test_gold.vcd test_gate.vcd
	python3 vcdmatch.py | tee vcdmatch.out

vivado:
	rm -f picorv32_vivado.log
	bash -c ". /opt/Xilinx/Vivado/2021.2/settings64.sh; vivado -mode batch -nojournal -log picorv32_vivado.log -source picorv32_vivado.tcl"

show_partition_list:
	sed 's/ : / :\n/' picorv32_vivado/partition.list | fold -s | sed '/ :/ ! s/^/  /'

show_partition_sizes:
	jq -c '{(input_filename): {gold_cells: .gold_module.cellcount, gate_cells: .gate_module.cellcount}}' picorv32_vivado/partitions/*.json | jq -Ss 'add'

clean:
	rm -f test_gold.vcd test_gate.vcd test_gold test_gate
	rm -f init_gold.vcd init_gate.vcd vcdmatch.out
	rm -rf picorv32_vivado picorv32_modified
