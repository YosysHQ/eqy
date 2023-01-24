EQY := eqy

test: read_source_fail/logfile.txt debug_mode/PASS error_verilog/logfile.txt none/none dummy/FAIL backup/PASS generate.eqy splitnets/PASS picorv32_vivado/FAIL timeout/PASS

read_source_fail/logfile.txt: read_source_fail.eqy counter.sv
	-$(EQY) -f read_source_fail.eqy --yosys /tmp/yosys

debug_mode/PASS: debug_mode.eqy counter.sv
	$(EQY) --debug -f debug_mode.eqy

error_verilog/logfile.txt: error_verilog.eqy error_verilog.sv
	-$(EQY) -f error_verilog.eqy

backup/PASS: backup.eqy counter.sv
	-$(EQY) backup.eqy
	-$(EQY) -b backup.eqy # 1st backup
	-$(EQY) -b backup.eqy # 2nd backup
	-$(EQY) -f backup.eqy # force recreate
	-$(EQY) backup.eqy   # fail on existing
	-$(EQY) backup.eqy -t -d backup # Cannot use -d with -t
	-$(EQY) backup.eqy -t # Use temp
	-$(EQY) backup.eqy -d backup # setting workdir when exist
	-rm -rf backup/
	-$(EQY) backup.eqy -d backup # setting workdir
	-$(EQY) -c backup.eqy # continue
	-rm -rf backup/
	-echo 1 > backup.test
	-$(EQY) -c backup.eqy -d backup.test # continue
	-rm -f backup.test
	-$(EQY) -c backup.eqy # Cannot continue
	-$(EQY) -f backup.eqy -p stat counter.state # working command
	-$(EQY) -f backup.eqy -p stat_error counter.state # non-working command

timeout/PASS:
	-timeout 2s $(EQY) -f timeout.eqy

none/none:
	-$(EQY)
	-$(EQY) -f dupl_section.eqy

dummy/FAIL:
	-$(EQY) -f dummy.eqy

generate.eqy:
	$(EQY) --init-config-file generate.eqy counter counter.sv counter.sv

splitnets/PASS: splitnets.eqy counter.sv
	$(EQY) -f splitnets.eqy

picorv32_vivado/FAIL:
	-$(EQY) -f picorv32_vivado.eqy

clean:
	rm -rf read_source_fail/ debug_mode/ error_verilog/ backup/ backup.bak*/ dummy/ generate.eqy splitnets/ picorv32_vivado/ timeout/

.PHONY: test clean
