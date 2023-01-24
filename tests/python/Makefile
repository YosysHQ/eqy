EQY := eqy

test: failing_tests passing_tests

passing_tests:
	@$(EQY) -f splitnets.eqy > /dev/null
	@$(EQY) --init-config-file generate.eqy counter counter.sv counter.sv 2>&1 | grep -i "template config written to"
	@rm -rf backup/ backup.bak*/; $(EQY) backup.eqy > /dev/null
	@$(EQY) -b backup.eqy > /dev/null # 1st backup
	@$(EQY) -b backup.eqy > /dev/null # 2nd backup
	@$(EQY) backup.eqy -t | grep -i "DONE (PASS, rc=0)" # Use temp
	@rm -rf backup/ backup.bak*/; $(EQY) backup.eqy -d backup > /dev/null  # setting workdir
	@$(EQY) -c backup.eqy > /dev/null # continue

failing_tests:
	@$(EQY) 2>&1 | grep -i "No config file given"
	@$(EQY) -f dupl_section.eqy 2>&1 | grep -i "duplicated strategy section"
	@$(EQY) -f error_verilog.eqy 2>&1 | grep -i "Reading sources failed"
	@$(EQY) -f read_source_fail.eqy --yosys /tmp/yosys 2>&1 | grep -i "Reading sources failed"
	@timeout 2s $(EQY) -f timeout.eqy 2>&1 | grep -i "Keyboard interrupt or external termination signal"
	@$(EQY) backup.eqy -t -d backup 2>&1 | grep -i "Cannot use -d with -t"
	@mkdir -p backup; $(EQY) backup.eqy 2>&1 | grep -i "Directory 'backup' already exists"
	@$(EQY) backup.eqy -d backup 2>&1 | grep -i "Directory 'backup' already exists" # setting workdir when exist
	@$(EQY) -f backup.eqy -p stat_error counter.state 2>&1 | grep -i "returned a non-zero exit code" # non-working command
	@$(EQY) -c backup.eqy -d backup.eqy 2>&1 | grep -i "Cannot continue in 'backup.eqy': not a directory"
	@rm -rf backup/; $(EQY) -c backup.eqy 2>&1 | grep -i "Cannot continue in" # Cannot continue
	@$(EQY) --debug -f picorv32_vivado.eqy 2>&1 | grep -i "DONE (FAIL, rc=2)"
	@$(EQY) -f syntax_error.eqy 2>&1 | grep -i "syntax error in syntax_error.eqy line 16"
	@$(EQY) -f unknown_option.eqy 2>&1 | grep -i "unknown option"
	@$(EQY) -f expected_opt_bool_val.eqy 2>&1 | grep -i "expected option value"
	@$(EQY) -f expected_opt_str_val.eqy 2>&1 | grep -i "expected option value"
	@$(EQY) -f expected_opt_int_val.eqy 2>&1 | grep -i "expected option value"
	@$(EQY) -f repeated_option_bool.eqy 2>&1 | grep -i "repeated option"
	@$(EQY) -f repeated_option_str.eqy 2>&1 | grep -i "repeated option"
	@$(EQY) -f repeated_option_int.eqy 2>&1 | grep -i "repeated option"
	@$(EQY) -f repeated_option_use.eqy 2>&1 | grep -i "repeated option"
	@$(EQY) -f no_use_line.eqy 2>&1 | grep -i "has no 'use' line"
	@$(EQY) -f expected_opt_bool_on_off.eqy 2>&1 | grep -i "expected one of"
	@$(EQY) -f expected_opt_int_integer.eqy 2>&1 | grep -i "expected integer option"
	@$(EQY) -f unknown_opt_other.eqy 2>&1 | grep -i "unknown option 'unknown'"
	@$(EQY) -f failed_partition.eqy 2>&1 | grep -i "Failed to partition design."
	@$(EQY) -f equivalence_problem.eqy 2>&1 | grep -i "A problem occurred during equivalence check."
	@$(EQY) -f problem_occured.eqy 2>&1 | grep -i "No configured strategy supports partition"

clean:
	# @rm -rf backup/ backup.bak*/ error_verilog/ generate.eqy picorv32_vivado/ read_source_fail/ timeout/ splitnets/ problem_occured/ failed_partition/ equivalence_problem/

.PHONY: test clean
