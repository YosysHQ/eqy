/*
Equivalence Checking with Yosys (eqy)

Copyright (C) 2020 Claire Wolf <claire@symbioticeda.com>
Copyright (C) 2020 N. Engelhardt <nak@symbioticeda.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct EqyPartitionPass : public Pass
{
	EqyPartitionPass() : Pass("eqy_partition", "partition combined design for eqy") { }

	void help() override
	{
	//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
	log("\n");
	log("    eqy_partition\n");
	log("\n");
	log("\n");
	}

	void partition_module_worker(Module *gold, Module *gate)
	{
		std::ofstream ofile;
		std::string filename = "partitions/" + gold->name.substr(6) + ".0.il";
		ofile.open(filename.c_str(), std::ofstream::trunc);
		if (ofile.fail())
			log_error("Can't open file `%s' for writing: %s\n", filename.c_str(), strerror(errno));

		Design *partition = new Design();
		partition->add(gold->clone());
		partition->add(gate->clone());
		Backend::backend_call(partition, &ofile, filename, "rtlil");
		delete partition;
	}

	void partition_worker(Design *design)
	{
		int num_gold_modules = 0;
		for (auto gold: design->modules())
		{
			if (gold->name.begins_with("\\gold."))
			{
				num_gold_modules++;
				Module *gate = design->module("\\gate." + gold->name.substr(6));
				if (!gate) log_error("Could not find matching gate for module %s\n", log_id(gold));
				partition_module_worker(gold, gate);
			}
			else if (!gold->name.begins_with("\\gate.") && gold->name != "\\miter")
				log_error("Found module %s that is neither gate nor gold nor miter. Was this design created with eqy_combine?\n", log_id(gold));
		}
		if (GetSize(design->modules_) != 2 * num_gold_modules + 1)
			log_error("Mismatched number of gate and gold modules. Was this design created with eqy_combine?\n");
	}

	void execute(std::vector<std::string> args, Design *design) override
	{

		// size_t argidx;
		// for (argidx = 1; argidx < args.size(); argidx++)
		// {
		// 	if ((args[argidx] == "-gold_ids") && argidx+1 < args.size()) {
		// 		gold_ids = fopen(args[++argidx].c_str(), "w");
		// 		if (!gold_ids) log_cmd_error("Can't create file %s.\n", args[argidx].c_str());
		// 		continue;
		// 	break;
		// }
		// extra_args(args, argidx, design, false);

		partition_worker(design);

	}

} EqyCombinePass;

PRIVATE_NAMESPACE_END
