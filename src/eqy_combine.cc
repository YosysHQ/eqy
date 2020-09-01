/* A simple Yosys plugin. (Copy&paste from http://stackoverflow.com/questions/32093541/how-does-the-yosys-consteval-api-work)

Usage example:

$ cat > evaldemo.v <<EOT
module main(input [1:0] A, input [7:0] B, C, D, output [7:0] Y);
  assign Y = A == 0 ? B : A == 1 ? C : A == 2 ? D : 42;
endmodule
EOT

$ yosys-config --build evaldemo.so evaldemo.cc
$ yosys -m evaldemo.so -p evaldemo evaldemo.v
*/

#include "kernel/yosys.h"
#include "kernel/consteval.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct EqyCombinePass : public Pass
{
	EqyCombinePass() : Pass("eqy_combine") { }

	void co_flatten_worker(RTLIL::Selection &sel, Design *work, Design *other, Module *mod)
	{
		for (auto cell : mod->cells())
		{
			Module *work_submod = work->module(cell->type);
			Module *other_submod = other->module(cell->type);
			if (work_submod && other_submod)
				co_flatten_worker(sel, work, other, work_submod);
			else
				sel.select(mod, cell);
		}
	}

	void co_flatten(Design *work, Design *other)
	{
		RTLIL::Selection sel(false);
		co_flatten_worker(sel, work, other, work->top_module());
		Pass::call_on_selection(work, sel, "flatten");
		Pass::call(work, "hierarchy");
	}

	void execute(vector<string>, Design *design) override
	{
		//TODO: error handling
		Design *gold_design = saved_designs.at("gold");
		Design *gate_design = saved_designs.at("gate");

		IdString gold_top = gold_design->top_module()->name;
		IdString gate_top = gate_design->top_module()->name;
		if (gold_top != gate_top)
			log_error("Top modules of gold and gate do not have the same name.\n");

		co_flatten(gold_design, gate_design);
		co_flatten(gate_design, gold_design);

		for (auto m : gold_design->modules())
		{
			Module *gold_m = m->clone();
			gold_m->attributes.erase("\\top");
			gold_m->name = "\\gold." + unescape_id(gold_m->name);
			design->add(gold_m);
			if (!gate_design->module(m->name))
				log_error("Unmatched module exists in gold that does not exist in gate. This should not happen. Please report this bug.\n");
			Module *gate_m = gate_design->module(m->name)->clone();
			gate_m->attributes.erase("\\top");
			gate_m->name = "\\gate." + unescape_id(gate_m->name);
			design->add(gate_m);
		}

		for (auto m : gate_design->modules())
		{
			if (!gold_design->module(m->name))
				log_error("Unmatched module exists in gate that does not exist in gold. This should not happen. Please report this bug.\n");
		}

		for (auto mod : design->modules())
		{
			for (auto cell : mod->cells())
			{
				IdString new_type = mod->name.str().substr(0, 6) + unescape_id(cell->type); //no comment
				if (mod->design->module(new_type))
					cell->type = new_type;
			}
		}

		Pass::call(design, std::vector<std::string>({"miter", "-equiv", "-ignore_gold_x", "-make_assert", "\\gold." + unescape_id(gold_top), "\\gate." + unescape_id(gold_top), "miter"}));

		design->module("\\miter")->set_bool_attribute("\\top");

	}
} EqyCombinePass;

PRIVATE_NAMESPACE_END
