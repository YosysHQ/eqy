test: aliases/PASS counter/PASS ex_amend/PASS ex_bind/PASS ex_group/PASS ex_join/PASS fsm/PASS

aliases/PASS: aliases.eqy aliases.sv
	eqy -f aliases.eqy

counter/PASS: counter.eqy counter.sv
	eqy -f counter.eqy

ex_amend/PASS: ex_amend.eqy ex_amend.sv
	eqy -f ex_amend.eqy

ex_bind/PASS: ex_bind.eqy ex_bind.sv
	eqy -f ex_bind.eqy

ex_group/PASS: ex_group.eqy ex_group.sv
	eqy -f ex_group.eqy

ex_join/PASS: ex_join.eqy ex_join.sv
	eqy -f ex_join.eqy

fsm/PASS: fsm.eqy fsm.sv
	eqy -f fsm.eqy

clean:
	rm -rf aliases/ counter/ ex_amend/ ex_bind/ ex_group/ ex_join/ fsm/

.PHONY: test clean
