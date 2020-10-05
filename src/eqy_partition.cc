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

	pool<SigBit> queue;
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

		log_debug("match: %s <-> %s\n", log_signal(gold_bit), log_signal(gate_bit));

		if (gold_drivers.count(gold_bit))
			queue.insert(gold_bit);

		gold_matches[gold_bit] = gate_bit;
		gate_matches[gate_bit] = gold_bit;
	}

	void add_match(SigSpec gold_sig, SigSpec gate_sig)
	{
		for (int i = 0; i < GetSize(gold_sig) && i < GetSize(gate_sig); i++)
			add_match(gold_sig[i], gate_sig[i]);
	}

	void add_match(Cell *gold_cell, Cell *gate_cell)
	{
		for (auto &conn : gold_cell->connections())
			if (gate_cell->connections().count(conn.first))
				add_match(conn.second, gate_cell->connections().at(conn.first));
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

			add_match(gold_cell, gate_cell);
			return;
		}

		Wire *gold_wire = gold->wire(gold_id);
		Wire *gate_wire = gate->wire(gate_id);

		if (gold_wire || gate_wire)
		{
			if (!gold_wire)
				log_error("Can't find wire %s in gold circuit.\n", log_id(gold_id));
			if (!gate_wire)
				log_error("Can't find wire %s in gate circuit.\n", log_id(gate_id));

			add_match(SigSpec(gold_wire), SigSpec(gate_wire));
			return;
		}
	}

	bool partition_open = false;
	pool<SigBit> part_inbits, part_outbits;
	pool<SigBit> part_gold_bits, part_gate_bits;
	pool<Cell*> part_gold_cells, part_gate_cells;

	void partition_begin()
	{
		log_assert(!partition_open);
		partition_open = true;
	}

	void partition_add(SigBit gold_bit)
	{
		gold_bit = gold_sigmap(gold_bit);

		log_assert(partition_open);
		log_assert(queue.count(gold_bit));
		queue.erase(gold_bit);

		std::function<void(SigBit,bool,bool)> add_bit_f;
		std::function<void(Cell*,bool)> add_cell_f;

		add_bit_f = [&](SigBit bit, bool in_gold, bool isoutput)->void
		{
			log_debug("+add_bit_f %s %s%s\n", log_signal(bit), in_gold ? "gold" : "gate", isoutput ? " [output]" : "");

			auto &gg_sigmap = in_gold ? gold_sigmap : gate_sigmap;
			auto &gg_drivers = in_gold ? gold_drivers : gate_drivers;
			auto &gg_matches = in_gold ? gold_matches : gate_matches;
			auto &part_gg_bits = in_gold ? part_gold_bits : part_gate_bits;

			bit = gg_sigmap(bit);

			bool insert_bit = !part_gg_bits.count(bit);

			if (!insert_bit && isoutput && gg_matches.count(bit)) {
				SigBit gold_bit = in_gold ? bit : gg_matches.at(bit);
				if (!part_outbits.count(gold_bit))
					insert_bit = true;
			}

			if (insert_bit)
			{
				bool isinput = false;

				part_gg_bits.insert(bit);

				if (gg_matches.count(bit))
				{
					SigBit xx_bit = gg_matches.at(bit);
					SigBit gold_bit = in_gold ? bit : xx_bit;
					bool run_other = false;

					if (isoutput) {
						run_other = !part_outbits.count(gold_bit);
						part_outbits.insert(gold_bit);
					} else {
						isinput = true;
						run_other = !part_inbits.count(gold_bit);
						part_inbits.insert(gold_bit);
					}

					if (run_other)
						add_bit_f(xx_bit, !in_gold, isoutput);
				}
				else
				{
					log_assert(!isoutput);
				}

				if (!isinput && gg_drivers.count(bit))
				{
					auto const &driver = gg_drivers.at(bit);
					auto driver_cell = std::get<0>(driver);
					add_cell_f(driver_cell, in_gold);
				}
			}

			log_debug("-add_bit_f\n");
		};

		add_cell_f = [&](Cell *cell, bool in_gold)->void
		{
			log_debug("+add_cell_f %s %s\n", log_id(cell), in_gold ? "gold" : "gate");

			auto &part_gg_cells = in_gold ? part_gold_cells : part_gate_cells;

			if (!part_gg_cells.count(cell))
			{
				part_gg_cells.insert(cell);

				for (auto &conn : cell->connections())
					if (cell->input(conn.first))
						for (auto bit : conn.second)
							add_bit_f(bit, in_gold, false);
			}

			log_debug("-add_cell_f\n");
		};

		log("Adding bit %s to current partition.\n", log_signal(gold_bit));
		add_bit_f(gold_bit, true, true);
	}

	Design *partition_finalize(IdString partname)
	{
		log_assert(partition_open);
		partition_open = false;

		log("Finalizing partition %s.\n", log_id(partname));

		Design *partition = new Design();

		Module *mod_gold = partition->addModule("\\gold." + partname.substr(1));
		Module *mod_gate = partition->addModule("\\gate." + partname.substr(1));

		auto copy_mod_contents = [&](bool in_gold)->void
		{
			// Module *in_mod = in_gold ? gold : gate;
			Module *out_mod = in_gold ? mod_gold : mod_gate;
			auto &sigmap = in_gold ? gold_sigmap : gate_sigmap;

			auto &part_gg_bits = in_gold ? part_gold_bits : part_gate_bits;
			auto &part_gg_cells = in_gold ? part_gold_cells : part_gate_cells;

			dict<SigBit,SigBit> mapped_bits;
			dict<Wire*,Wire*> mapped_wires;

			SigSpec pi, po;

			for (auto bit : part_gg_bits) {
				Wire *w = bit.wire;
				if (!w) continue;
				if (!mapped_wires.count(w)) {
					Wire *ww = out_mod->addWire(w->name, GetSize(w));
					log_debug("%s partition wire: %s\n", in_gold ? "gold" : "gate", log_id(ww));
					// TBD: Copy some of the wire metadata
					mapped_wires[w] = ww;
				}
				mapped_bits[bit] = SigBit(mapped_wires.at(w), bit.offset);
			}

			for (auto bit : part_inbits)
			{
				log_debug("%s partition pi bit: %s\n", in_gold ? "gold" : "gate", log_signal(bit));
				if (!in_gold)
					bit = gold_matches.at(bit);
				pi.append(bit);
			}

			for (auto bit : part_outbits)
			{
				log_debug("%s partition po bit: %s\n", in_gold ? "gold" : "gate", log_signal(bit));
				if (!in_gold)
					bit = gold_matches.at(bit);
				po.append(bit);
			}

			for (auto &it : mapped_wires) {
				Wire *w = it.first, *ww = it.second;
				for (int i = 0; i < GetSize(w); i++)
					if (!mapped_bits.count(SigBit(w, i)))
						out_mod->connect(SigBit(ww, i), State::Sz);
			}

			for (auto c : part_gg_cells)
			{
				Cell *cc = out_mod->addCell(c->name, c->type);
				cc->parameters = c->parameters;
				log_debug("%s partition cell: %s\n", in_gold ? "gold" : "gate", log_id(cc));

				for (auto &conn : c->connections()) {
					SigSpec s;
					for (auto bit : sigmap(conn.second)) {
						if (mapped_bits.count(bit))
							s.append(mapped_bits.at(bit));
						else
							s.append(out_mod->addWire(NEW_ID));
					}
					cc->setPort(conn.first, s);
				}
			}

			Wire *piw = out_mod->addWire("\\__pi", GetSize(pi));
			piw->port_input = true;
			piw->port_id = 1;
			out_mod->connect(pi, piw);

			Wire *pow = out_mod->addWire("\\__po", GetSize(po));
			pow->port_output = true;
			pow->port_id = 2;
			out_mod->connect(pow, po);

			// TBD: Create blackbox modules as needed
		};

		copy_mod_contents(true);
		copy_mod_contents(false);

		part_inbits.clear();
		part_outbits.clear();
		part_gold_bits.clear();
		part_gate_bits.clear();
		part_gold_cells.clear();
		part_gate_cells.clear();

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

	void partition_full_module_worker(Module *gold, Module *gate)
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

	void partition_worker(Design *design, bool full_module_mode)
	{
		int num_gold_modules = 0;
		for (auto gold : design->modules())
		{
			if (gold->name.begins_with("\\gold."))
			{
				num_gold_modules++;
				Module *gate = design->module("\\gate." + gold->name.substr(6));
				if (!gate) log_error("Could not find matching gate for module %s\n", log_id(gold));
				log_header(design, "Processing module pair %s / %s.\n", log_id(gold), log_id(gate));
				if (full_module_mode) {
					partition_full_module_worker(gold, gate);
				} else {
					EqyPartitionWorker worker(gold, gate);
					// TBD: Register match points
					// TBD: Consolidate partitions

					// Force ports to be match points
					for (auto w : gold->wires())
						if (w->port_id)
							worker.add_match(w->name, w->name);

					int partidx = 0;
					while (!worker.queue.empty())
					{
						worker.partition_begin();
						worker.partition_add(*worker.queue.begin());
						std::ofstream ofile;
						std::string filename = stringf("partitions/%s.%d.il", gold->name.substr(6).c_str(), partidx);
						IdString partname = stringf("\\%s.%d", gold->name.substr(6).c_str(), partidx++);
						Design *partition = worker.partition_finalize(partname);
						ofile.open(filename.c_str(), std::ofstream::trunc);
						if (ofile.fail())
							log_error("Can't open file `%s' for writing: %s\n", filename.c_str(), strerror(errno));
						Backend::backend_call(partition, &ofile, filename, "rtlil");
						log_spacer();
						delete partition;
					}
				}
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
		for (std::string line; std::getline(matched_file, line); ) {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 3)
				log_error("Malformed file %s\n", filename.c_str());
			matched_ids[things[0]].push_back(std::make_pair(things[1], things[2]));
		}
		return matched_ids;
	}

	dict<std::string, dict<std::string, pool<std::string>>> read_partition_names(std::string filename)
	{
		/* dict (module -> dict (partition_name -> pool (IDs))) */
		dict<std::string, dict<std::string, pool<std::string>>> partition_names;
		std::ifstream partition_names_file(filename.c_str());
		if (!partition_names_file)
			log_error("Cannot open file '%s'\n", filename.c_str());
		std::string line;
		for (std::string line; std::getline(partition_names_file, line); ) {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 4)
				log_error("Malformed file %s\n", filename.c_str());
			partition_names[things[1]][things[3]].insert(things[2]);
		}
		return partition_names;
	}

	dict<std::string, pool<std::string>> read_nosplit_ids(std::string filename)
	{
		dict<std::string, pool<std::string>> nosplit_ids;
		std::ifstream nosplit_file(filename.c_str());
		if (!nosplit_file)
			log_error("Cannot open file '%s'\n", filename.c_str());
		std::string line;
		for (std::string line; std::getline(nosplit_file, line); ) {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 3)
				log_error("Malformed file %s\n", filename.c_str());
			nosplit_ids[things[1]].insert(things[2]);
		}
		return nosplit_ids;
	}

	void execute(std::vector<std::string> args, Design *design) override
	{
		std::string matched_ids_filename, partition_names_filename, nosplit_ids_filename;
		bool full_module_mode = false;

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++)
		{
			if ((args[argidx] == "-matched_ids") && argidx+1 < args.size()) {
				matched_ids_filename = args[++argidx];
				continue;
			}
			if ((args[argidx] == "-partition_names") && argidx+1 < args.size()) {
				partition_names_filename = args[++argidx];
				continue;
			}
			if ((args[argidx] == "-nosplit_ids") && argidx+1 < args.size()) {
				nosplit_ids_filename = args[++argidx];
				continue;
			}
			if ((args[argidx] == "-fullmods")) {
				full_module_mode = true;
				continue;
			}
			break;
		}
		extra_args(args, argidx, design, false);

		log_header(design, "Executing EQY PARTITION task.\n");

		auto matched_ids = read_matched_ids(matched_ids_filename);
		for (auto i : matched_ids)
			for (auto j : i.second)
				log_debug("Found ID match: %s %s %s\n", i.first.c_str(), j.first.c_str(), j.second.c_str());

		auto partition_names = read_partition_names(partition_names_filename);
		for (auto i : partition_names)
			for (auto j : i.second)
			{
				log_debug("In module %s, entities ", i.first.c_str());
				for (std::string k : j.second)
					log_debug("%s ", k.c_str());
				log_debug("are assigned to partition %s\n", j.first.c_str());
			}

		auto nosplit_ids = read_nosplit_ids(nosplit_ids_filename);
		for (auto i : nosplit_ids)
		{
			log_debug("In module %s, do not split entities", i.first.c_str());
			for (std::string j : i.second)
				log_debug(" %s", j.c_str());
			log_debug("\n");
		}

		log_push();
		partition_worker(design, full_module_mode);
		log_pop();
	}

} EqyPartitionPass;

PRIVATE_NAMESPACE_END
