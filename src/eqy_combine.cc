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

	void execute(vector<string>, Design *design) override
	{
		Design *gold_design = saved_designs.at("gold");
		Design *gate_design = saved_designs.at("gate");

		//TODO: co-flatten

		for (auto m: gold_design->modules())
		{
			Module *gold_m = m->clone();
			gold_m->name = "\\gold." + unescape_id(gold_m->name);
			design->add(gold_m);
			Module *gate_m = gate_design->module(m->name)->clone();
			gate_m->name = "\\gate." + unescape_id(gate_m->name);
			design->add(gate_m);
		}

	}
} EqyCombinePass;

PRIVATE_NAMESPACE_END
