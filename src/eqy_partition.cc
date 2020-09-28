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
#include "kernel/sigtools.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct EqyPartitionWorker
{
	Module *gold, *gate;
	SigMap gold_sigmap;
	SigMap gate_sigmap;

	dict<SigBit, tuple<Cell*, IdString, int>> gold_drivers;
	dict<SigBit, tuple<Cell*, IdString, int>> gate_drivers;

	dict<SigBit, SigBit> gold_matches;
	dict<SigBit, SigBit> gate_matches;

	void register_drivers(Module *m, SigMap &sm, dict<SigBit, tuple<Cell*, IdString, int>> &db)
	{
		for (auto cell : m->cells()) {
			for (auto &conn : cell->connections()) {
				if (cell->input(conn.first))
					continue;
				for (int i = 0; i < GetSize(conn.second); i++) {
					SigBit bit = sm(conn.second[i]);
					if (db.count(bit) != 0)
						log_error("Multiple drivers for %s.\n", log_signal(bit));
					db[bit] = tuple<Cell*, IdString, int>(cell, conn.first, i);
				}
			}
		}
	}

	EqyPartitionWorker(Module *gold, Module *gate) : gold(gold), gate(gate), gold_sigmap(gold), gate_sigmap(gate)
	{
		register_drivers(gold, gold_sigmap, gold_drivers);
		register_drivers(gate, gate_sigmap, gate_drivers);
	}

	void add_match(SigBit gold_bit, SigBit gate_bit)
	{
		gold_bit = gold_sigmap(gold_bit);
		gate_bit = gate_sigmap(gate_bit);

		gold_matches[gold_bit] = gate_bit;
		gate_matches[gate_bit] = gold_bit;
	}

	void add_match(SigSpec gold_sig, SigSpec gate_sig)
	{
		for (int i = 0; i < GetSize(gold_sig) && i < GetSize(gate_sig); i++)
			add_match(gold_sig[i], gate_sig[i]);
	}

	void add_match(IdString gold_id, IdString gate_id)
	{
		Cell *gold_cell = gold->cell(gold_id);
		Cell *gate_cell = gate->cell(gate_id);

		if (gold_cell || gate_cell)
		{
			if (!gold_cell)
				log_error("Can't find cell %s in gold circuit.\n", log_id(gold_id));
			if (!gate_cell)
				log_error("Can't find cell %s in gate circuit.\n", log_id(gate_id));

			return;
		}
	}

	Design *make_partition(IdString partname, pool<SigBit> gold_outbits)
	{
		Design *partition = new Design();

		Module *mod_gold = partition->addModule("\\gold." + partname.substr(1));
		Module *mod_gate = partition->addModule("\\gate." + partname.substr(1));

		int primary_io_idx = 1;
		dict<SigBit, SigBit> mapped_gold_bits;
		dict<SigBit, SigBit> mapped_gate_bits;

		std::function<SigBit(SigBit,bool,bool)> add_bit_f;
		std::function<Cell*(Cell*,bool)> add_cell_f;

		add_bit_f = [&](SigBit bit, bool in_gold, bool primary_output)->SigBit
		{
			auto mod_gg = in_gold ? mod_gold : mod_gate;
			auto mod_xx = !in_gold ? mod_gold : mod_gate;

			auto &mapped_gg_bits = in_gold ? mapped_gold_bits : mapped_gate_bits;
			auto &mapped_xx_bits = !in_gold ? mapped_gold_bits : mapped_gate_bits;

			auto &gg_sigmap = in_gold ? gold_sigmap : gate_sigmap;
			auto &gg_drivers = in_gold ? gold_drivers : gate_drivers;
			auto &gg_matches = in_gold ? gold_matches : gate_matches;

			bit = gg_sigmap(bit);

			if (mapped_gg_bits.count(bit) == 0)
			{
				mapped_gg_bits[bit] = mod_gg->addWire(NEW_ID);

				if (gg_matches.count(bit))
				{
					if (mapped_xx_bits.count(gg_matches.at(bit)))
					{
						auto gg_bit = mapped_gg_bits.at(bit);
						auto xx_bit = add_bit_f(gg_matches.at(bit), !in_gold, primary_output);

						if (primary_output)
						{
							Wire *gg_wire = mod_gg->addWire(stringf("\\__po_%d", primary_io_idx));
							Wire *xx_wire = mod_xx->addWire(stringf("\\__po_%d", primary_io_idx));
							primary_io_idx++;

							gg_wire->port_output = true;
							xx_wire->port_output = true;

							mod_gg->connect(gg_wire, gg_bit);
							mod_xx->connect(xx_wire, xx_bit);
						}
						else
						{
							Wire *gg_wire = mod_gg->addWire(stringf("\\__pi_%d", primary_io_idx));
							Wire *xx_wire = mod_xx->addWire(stringf("\\__pi_%d", primary_io_idx));
							primary_io_idx++;

							gg_wire->port_input = true;
							xx_wire->port_input = true;

							mod_gg->connect(gg_bit, gg_wire);
							mod_xx->connect(xx_bit, xx_wire);
						}
					}
				}
				else
				{
					// TBD
				}
			}

			return mapped_gg_bits.at(bit);
		};

		add_cell_f = [&](Cell *cell, bool in_gold)->Cell*
		{
			// TBD
			return nullptr;
		};

		for (auto gold_bit : gold_outbits)
		{
			gold_bit = gold_sigmap(gold_bit);
			SigBit gate_bit = gold_matches.at(gold_bit);

			SigBit actual_gold_bit = add_bit_f(gold_bit, true, true);
			SigBit actual_gate_bit = add_bit_f(gate_bit, false, true);
		}

		return partition;
	}
};

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

	dict<std::string, std::vector<std::pair<std::string, std::string>>> read_matched_ids(std::string filename)
	{
		dict<std::string, std::vector<std::pair<std::string, std::string>>> matched_ids;
		std::ifstream matched_file(filename.c_str());
		if (!matched_file)
			log_error("Cannot open file '%s'\n", filename.c_str());
		std::string line;
		for (std::string line; std::getline(matched_file, line); )
    {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 3)
				log_error("Malformed file %s\n", filename.c_str());
			matched_ids[things[0]].push_back(std::make_pair(things[1], things[2]));
		}
		return matched_ids;
	}

	void execute(std::vector<std::string> args, Design *design) override
	{
		std::string matched_ids_filename;
		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++)
		{
			if ((args[argidx] == "-matched_ids") && argidx+1 < args.size()) {
				matched_ids_filename = args[++argidx];
				continue;
			}
			break;
		}
		extra_args(args, argidx, design, false);
		auto matched_ids = read_matched_ids(matched_ids_filename);
		for (auto i : matched_ids)
			for (auto j : i.second)
				log_debug("Found ID match: %s %s %s\n", i.first.c_str(), j.first.c_str(), j.second.c_str());
		partition_worker(design);

	}

} EqyPartitionPass;

PRIVATE_NAMESPACE_END
