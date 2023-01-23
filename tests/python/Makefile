EQY := eqy

test: read_source_fail/logfile.txt debug_mode/PASS error_verilog/logfile.txt none/none dummy/FAIL backup/PASS

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
	-$(EQY) -c backup.eqy # Cannot continue
	-$(EQY) -f backup.eqy -p stat counter.state # working command
	-$(EQY) -f backup.eqy -p stat_error counter.state # non-working command

none/none:
	-$(EQY)

dummy/FAIL:
	-$(EQY) -f dummy.eqy

clean:
	rm -rf read_source_fail/ debug_mode/ error_verilog/ backup/ backup.bak*/ dummy/

.PHONY: test clean
