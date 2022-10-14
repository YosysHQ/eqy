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

struct Partition;

struct EqyPartitionWorker
{
	std::vector<std::unique_ptr<Partition>> partitions;
	dict<SigBit, int> po_primitive_index;
	dict<SigBit, int> po_partition_index;
	dict<SigBit, pool<int>> pi_primitives_index;
	dict<SigBit, pool<int>> pi_partitions_index;

	Module *gold, *gate;
	SigMap gold_sigmap;
	SigMap gate_sigmap;

	dict<SigBit, tuple<Cell*, IdString, int>> gold_drivers;
	dict<SigBit, tuple<Cell*, IdString, int>> gate_drivers;

	dict<SigBit, pool<SigBit>> aliases;
	dict<SigBit, SigBit> raliases;
	dict<SigBit, State> constants;

	pool<SigBit> queue;
	dict<SigBit, SigBit> gold_matches;
	dict<SigBit, SigBit> gate_matches;
	dict<Cell*, Cell*> gold_matched_cells;
	dict<Cell*, Cell*> gate_matched_cells;

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

		if (!gold_bit.wire)
			return;

		log_debug("match: %s <-> %s\n", log_signal(gold_bit), log_signal(gate_bit));

		if (!gate_bit.wire) {
			if (!constants.count(gold_bit))
				log("found constant gate bit for gold bit %s: %s\n", log_signal(gold_bit), log_signal(gate_bit));
			else if (constants.at(gold_bit) != State(gate_bit.data))
				log("conflicting constants for gold bit %s: %s vs %s\n", log_signal(gold_bit),
						log_signal(constants.at(gold_bit)), log_signal(gate_bit));
			constants[gold_bit] = State(gate_bit.data);
		}

		if (gold_drivers.count(gold_bit)) {
			auto &driver = gold_drivers.at(gold_bit);
			if (gold_matched_cells.count(std::get<0>(driver)))
				queue.erase(gold_bit);
			else
				queue.insert(gold_bit);
		} else {
			queue.erase(gold_bit);
		}

		if (gold_matches.count(gold_bit) && gold_matches.at(gold_bit) != gate_bit) {
			log_error("conflicting matches for gold bit %s: %s vs %s\n", log_signal(gold_bit),
					log_signal(gold_matches.at(gold_bit)), log_signal(gate_bit));
		}

		if (gate_matches.count(gate_bit) && gate_matches.at(gate_bit) != gold_bit) {
			SigBit master_gold_bit = gate_matches.at(gate_bit);
			if (raliases.count(gold_bit) == 0)
				log("found gold bit aliases via gate bit %s: %s vs %s\n", log_signal(gate_bit),
						log_signal(master_gold_bit), log_signal(gold_bit));
			else if (raliases.at(gold_bit) != master_gold_bit)
				log_error("conflicting aliases for gold bit %s: %s vs %s\n", log_signal(gold_bit),
						log_signal(raliases.at(gold_bit)), log_signal(master_gold_bit));
			aliases[master_gold_bit].insert(master_gold_bit);
			aliases[master_gold_bit].insert(gold_bit);
			raliases[gold_bit] = master_gold_bit;
		} else if (gate_bit.wire) {
			gate_matches[gate_bit] = gold_bit;
		}

		gold_matches[gold_bit] = gate_bit;
	}

	void add_match(SigSpec gold_sig, SigSpec gate_sig)
	{
		for (int i = 0; i < GetSize(gold_sig) && i < GetSize(gate_sig); i++)
			add_match(gold_sig[i], gate_sig[i]);
	}

	void add_match(Cell *gold_cell, Cell *gate_cell)
	{
		if (gold_matched_cells.count(gold_cell) && gold_matched_cells.at(gold_cell) != gate_cell)
			log_error("conflicting matches for gold cell %s: %s vs %s\n", log_id(gold_cell),
					log_id(gold_matched_cells.at(gold_cell)), log_id(gate_cell));

		if (gate_matched_cells.count(gate_cell) && gate_matched_cells.at(gate_cell) != gold_cell)
			log_error("conflicting matches for gate cell %s: %s vs %s\n", log_id(gate_cell),
					log_id(gate_matched_cells.at(gate_cell)), log_id(gold_cell));

		gold_matched_cells[gold_cell] = gate_cell;
		gate_matched_cells[gate_cell] = gold_cell;

		log_debug("cell match: %s <-> %s\n", log_id(gold_cell), log_id(gate_cell));

		for (auto &conn : gold_cell->connections())
			if (gate_cell->connections().count(conn.first))
				add_match(conn.second, gate_cell->connections().at(conn.first));

		log_debug("end of cell match.\n");
	}

	void add_match(IdString gold_id, IdString gate_id)
	{
		log_debug("id match: %s <-> %s\n", log_id(gold_id), log_id(gate_id));

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

	Partition *create_partition();
	void create_partitions();
	void merge_partitions();
	void ammend_partitions();
	void finalize_partitions(std::ofstream &partition_list_file);
};

struct Partition
{
	EqyPartitionWorker *worker;
	int merged_into = -1;
	int index;

	// A 'finalized' partition has either been written to an output file, or was replaced
	// as partition to-be-written by merging it into another partition, making that other
	// partition responsible for proving the POs that used to belong to this partition.
	bool finalized = false;

	// A 'primitive' partition is the original partition for a PO (or a set of merged-early POs),
	// before merging partitions and/or importing gold data from one partition into another.
	bool primitive = false;

	pool<SigBit> part_inbits, part_outbits;
	pool<SigBit> part_gold_bits, part_gate_bits;
	pool<Cell*> part_gold_cells, part_gate_cells;

	Partition(EqyPartitionWorker *worker) : worker(worker), index(GetSize(worker->partitions)) { }

	Partition *clone_primitive()
	{
		log_assert(!finalized);
		if (!primitive) return this;

		Partition *other = worker->create_partition();
		merged_into = other->index;
		finalized = true;

		// TBD: Create a non-primitive clone of this partition and mark this partition as finalized.

		return other;
	}

	void merge_partiton(Partition *other)
	{
		log_assert(!finalized);
		log_assert(!other->finalized);

		// TBD: Merge the other partition into this partition, and mark the other partiton as
		// finalized. POs of the other partiton become POs of this partition, potentially replacing
		// existing PIs of this partiton. PIs of the other partition becme PIs of this partition,
		// unless those nets already exist (as PIs, POs, or internal nets).

		other->finalized = true;
		other->merged_into = index;
	}

	void import_partition(const Partition *other)
	{
		log_assert(!finalized);
		log_assert(other->primitive);

		// TBD: Copy the gold netlist of the other partition into both gold and gate of this partition.
		// POs of the other partiton become internal nets of this partition, potentially replacing
		// existing PIs of this partiton. PIs of the other partition becme PIs of this partition,
		// unless those nets already exist (as PIs, POs, or internal nets).
	}

	void partition_add(SigBit gold_bit)
	{
		gold_bit = worker->gold_sigmap(gold_bit);

		log_assert(!finalized);
		log_assert(worker->queue.count(gold_bit));
		worker->queue.erase(gold_bit);

		std::function<void(SigBit,bool,bool,int)> add_bit_f;
		std::function<void(Cell*,bool,int)> add_cell_f;

		add_bit_f = [&](SigBit bit, bool in_gold, bool isoutput, int indent)->void
		{
			auto &gg_sigmap = in_gold ? worker->gold_sigmap : worker->gate_sigmap;
			auto &gg_drivers = in_gold ? worker->gold_drivers : worker->gate_drivers;
			auto &gg_matches = in_gold ? worker->gold_matches : worker->gate_matches;
			auto &part_gg_bits = in_gold ? part_gold_bits : part_gate_bits;

			bit = gg_sigmap(bit);

			if (!bit.wire)
				return;

			bool insert_bit = !part_gg_bits.count(bit);

			if (!insert_bit && isoutput && gg_matches.count(bit)) {
				SigBit gold_bit = in_gold ? bit : gg_matches.at(bit);
				if (!part_outbits.count(gold_bit))
					insert_bit = true;
			}

			log_debug("%*sadd_bit_f %s %s%s: %s\n", indent, "", log_signal(bit),
					in_gold ? "gold" : "gate", isoutput ? " [output]" : "", insert_bit ? "insert" : "skip");

			if (!insert_bit)
				return;

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
					if (primitive)
						worker->po_primitive_index[gold_bit] = index;
					worker->po_partition_index[gold_bit] = index;
				} else {
					isinput = true;
					run_other = !part_inbits.count(gold_bit);
					part_inbits.insert(gold_bit);
					if (primitive)
						worker->pi_primitives_index[gold_bit].insert(index);
					worker->pi_partitions_index[gold_bit].insert(index);
				}

				if (run_other)
					add_bit_f(xx_bit, !in_gold, isoutput, indent+2);
			}
			else
			{
				log_assert(!isoutput);
			}

			if (!isinput && gg_drivers.count(bit))
			{
				auto const &driver = gg_drivers.at(bit);
				auto driver_cell = std::get<0>(driver);
				add_cell_f(driver_cell, in_gold, indent+2);
			}
		};

		add_cell_f = [&](Cell *cell, bool in_gold, int indent)->void
		{
			auto &part_gg_cells = in_gold ? part_gold_cells : part_gate_cells;
			bool insert_cell = !part_gg_cells.count(cell);

			log_debug("%*sadd_cell_f %s %s: %s\n", indent, "", log_id(cell),
					in_gold ? "gold" : "gate", insert_cell ? "insert" : "skip");

			if (!insert_cell)
				return;

			part_gg_cells.insert(cell);

			for (auto &conn : cell->connections())
				if (cell->input(conn.first))
					for (auto bit : conn.second)
						add_bit_f(bit, in_gold, false, indent+2);
		};

		log("Adding bit %s to partition %d.\n", log_signal(gold_bit), index);
		add_bit_f(gold_bit, true, true, 2);
	}

	Design *partition_finalize(IdString partname)
	{
		log_assert(!finalized);
		finalized = true;

		log("Finalizing partition %d as %s.\n", index, log_id(partname));

		Design *partdesign = new Design();

		Module *mod_gold = partdesign->addModule("\\gold." + partname.substr(1));
		Module *mod_gate = partdesign->addModule("\\gate." + partname.substr(1));

		auto copy_mod_contents = [&](bool in_gold, const SigSpec &pi, const SigSpec &po, const SigSig &conn)->void
		{
			// Module *in_mod = in_gold ? gold : gate;
			Module *out_mod = in_gold ? mod_gold : mod_gate;
			auto &sigmap = in_gold ? worker->gold_sigmap : worker->gate_sigmap;

			auto &part_gg_bits = in_gold ? part_gold_bits : part_gate_bits;
			auto &part_gg_cells = in_gold ? part_gold_cells : part_gate_cells;

			dict<SigBit,SigBit> mapped_bits;
			dict<Wire*,Wire*> mapped_wires;

			for (auto bit : part_gg_bits) {
				Wire *w = bit.wire;
				if (!w) continue;
				if (!mapped_wires.count(w)) {
					Wire *ww = out_mod->addWire(w->name, GetSize(w));
					log_debug("  %s partition wire: %s\n", in_gold ? "gold" : "gate", log_id(ww));
					// TBD: Copy some of the wire metadata
					mapped_wires[w] = ww;
				}
				mapped_bits[bit] = SigBit(mapped_wires.at(w), bit.offset);
			}

			for (auto &it : mapped_wires) {
				Wire *w = it.first, *ww = it.second;
				for (int i = 0; i < GetSize(w); i++)
					if (!mapped_bits.count(SigBit(w, i)))
						out_mod->connect(SigBit(ww, i), State::Sz);
			}

			for (int i = 0; i < GetSize(conn.first); i++)
				out_mod->connect(mapped_bits.at(conn.first[i]), conn.second[i].wire ? mapped_bits.at(conn.second[i]) : conn.second[i]);

			for (auto c : part_gg_cells)
			{
				Cell *cc = out_mod->addCell(c->name, c->type);
				log_debug("  %s partition cell: %s\n", in_gold ? "gold" : "gate", log_id(cc));
				// TBD: Copy some of the cell metadata
				cc->parameters = c->parameters;

				for (auto &conn : c->connections()) {
					SigSpec s;
					for (auto bit : sigmap(conn.second)) {
						if (bit. wire == nullptr)
							s.append(bit);
						else if (c->output(conn.first) && part_inbits.count(bit))
							s.append(out_mod->addWire(NEW_ID));
						else if (mapped_bits.count(bit))
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
		};

		dict<SigBit, int> gate_pi_positions;

		SigSpec gold_pi, gold_po, gate_pi, gate_po;
		SigSig gold_conn, gate_conn;

		for (auto bit : part_inbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			if (gate_pi_positions.count(gate_bit)) {
				int idx = gate_pi_positions.at(gate_bit);
				log("  partition pi alias for bit %d: %s := %s <-> %s\n", idx, log_signal(bit), log_signal(gold_pi[idx]), log_signal(gate_bit));
				gold_conn.first.append(bit);
				gold_conn.second.append(gold_pi[idx]);
			} else if (!gate_bit.wire) {
				log("  partition pi alias for constant: %s <-> %s\n", log_signal(bit), log_signal(gate_bit));
				gold_conn.first.append(bit);
				gold_conn.second.append(gate_bit);
			} else {
				log("  partition pi bit %d: %s <-> %s\n", GetSize(gold_pi), log_signal(bit), log_signal(gate_bit));
				gate_pi_positions[gate_bit] = GetSize(gold_pi);
				gold_pi.append(bit);
				gate_pi.append(gate_bit);
			}
		}

		for (auto bit : part_outbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			log("  partition po bit %d: %s <-> %s\n", GetSize(gold_po), log_signal(bit), log_signal(gate_bit));
			gold_po.append(bit);
			gate_po.append(gate_bit);
		}

		copy_mod_contents(true, gold_pi, gold_po, gold_conn);
		copy_mod_contents(false, gate_pi, gate_po, gate_conn);

		return partdesign;
	}
};

Partition *EqyPartitionWorker::create_partition()
{
	partitions.push_back(std::unique_ptr<Partition>(new Partition(this)));
	return partitions.back().get();
}

void EqyPartitionWorker::create_partitions()
{
	while (!queue.empty())
	{
		SigBit gold_bit = *queue.begin();

		Partition *partition = create_partition();
		partition->primitive = true;

		partition->partition_add(gold_bit);

		for (auto &it : aliases.at(raliases.at(gold_bit, gold_bit), {})) {
			if (queue.count(it)) partition->partition_add(it);
		}
	}
}

void EqyPartitionWorker::merge_partitions()
{
	// TBD
}

void EqyPartitionWorker::ammend_partitions()
{
	// TBD
}

void EqyPartitionWorker::finalize_partitions(std::ofstream &partition_list_file)
{
	for (auto &it : partitions)
	{
		Partition *partition = it.get();
		if (partition->finalized) continue;

		std::ofstream ofile;
		std::string filename = stringf("partitions/%s.%d.il", gold->name.substr(6).c_str(), partition->index);

		IdString partname = stringf("\\%s.%d", gold->name.substr(6).c_str(), partition->index);
		Design *partdesign = partition->partition_finalize(partname);

		ofile.open(filename.c_str(), std::ofstream::trunc);
		if (ofile.fail())
			log_error("Can't open file `%s' for writing: %s\n", filename.c_str(), strerror(errno));

		Backend::backend_call(partdesign, &ofile, filename, "rtlil");
		partition_list_file << unescape_id(gold->name).substr(5) << " ";
		partition_list_file << unescape_id(partname);

		for (auto bit : partition->part_outbits)
			partition_list_file << stringf(" %s[%d]", unescape_id(bit.wire->name).c_str(), bit.offset);

		partition_list_file << " <=";

		for (auto bit : partition->part_inbits)
			partition_list_file << stringf(" %s[%d]", unescape_id(bit.wire->name).c_str(), bit.offset);

		partition_list_file << "\n";

		delete partdesign;
		log_spacer();
	}
}

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

	void partition_worker(Design *design, bool full_module_mode,
			const dict<std::string, std::vector<std::pair<std::string, std::string>>> &matched_ids,
			const dict<std::string, std::vector<std::vector<std::string>>> & /* partiton_ids */,
			std::ofstream &partition_list_file)
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

					// Register match points
					if (!matched_ids.count(gold->name.substr(6)))
						log_error("No matched IDs for module %s.\n", gold->name.substr(6).c_str());
					for (auto &it : matched_ids.at(gold->name.substr(6)))
						worker.add_match(IdString(RTLIL::escape_id(it.first)), IdString(RTLIL::escape_id(it.second)));

					// Force ports to be match points
					for (auto w : gold->wires())
						if (w->port_id)
							worker.add_match(w->name, w->name);

					// TBD: Register partition configuration

					worker.create_partitions();
					worker.merge_partitions();
					worker.ammend_partitions();
					worker.finalize_partitions(partition_list_file);
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
		for (int linenr = 1; std::getline(matched_file, line); linenr++) {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 3)
				log_error("Malformed line %d in file %s\n", linenr, filename.c_str());
			matched_ids[things[0]].push_back(std::make_pair(things[1], things[2]));
		}
		return matched_ids;
	}

	dict<std::string, std::vector<std::vector<std::string>>> read_partition_ids(std::string filename)
	{
		dict<std::string, std::vector<std::vector<std::string>>> partition_ids;

		std::ifstream partition_names_file(filename.c_str());
		if (!partition_names_file)
			log_error("Cannot open file '%s'\n", filename.c_str());
		std::string line;
		for (int linenr=1; std::getline(partition_names_file, line); linenr++) {
			std::vector<std::string> things = split_tokens(line);
			if ((things[0] == "name" || things[0] == "group" || things[0] == "merge" ||
					things[0] == "path") && GetSize(things) == 4) {
				partition_ids[things[1]].push_back({things[0], things[2], things[3]});
				continue;
			}
			if ((things[0] == "nostop" || things[0] == "sticky" || things[0] == "nosplit" ||
					things[0] == "noautogroup" || things[0] == "final") && GetSize(things) == 3) {
				partition_ids[things[1]].push_back({things[0], things[2]});
				continue;
			}
			log_error("Malformed line %d in file %s\n", linenr, filename.c_str());
		}
		return partition_ids;
	}

	void execute(std::vector<std::string> args, Design *design) override
	{
		std::string matched_ids_filename, partition_ids_filename, partition_list_filename;
		bool full_module_mode = false;

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++)
		{
			if ((args[argidx] == "-matched_ids") && argidx+1 < args.size()) {
				matched_ids_filename = args[++argidx];
				continue;
			}
			if ((args[argidx] == "-partition_ids") && argidx+1 < args.size()) {
				partition_ids_filename = args[++argidx];
				continue;
			}
			if ((args[argidx] == "-create_partition_list") && argidx+1 < args.size()) {
				partition_list_filename = args[++argidx];
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

		//TBD: handle absent arguments
		auto matched_ids = read_matched_ids(matched_ids_filename);
		auto partition_ids = read_partition_ids(partition_ids_filename);
		std::ofstream partition_list_file(partition_list_filename, std::ofstream::out);

		log_push();
		partition_worker(design, full_module_mode, matched_ids, partition_ids, partition_list_file);
		log_pop();
	}
} EqyPartitionPass;

PRIVATE_NAMESPACE_END
