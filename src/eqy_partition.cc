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
#include "kernel/ffinit.h"
#include "kernel/mem.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct Partition;

std::string increase_indent(const std::string &indent)
{
#ifndef NDEBUG
	if (!log_force_debug)
		return std::string();
	if (indent.size() <= 40)
		return indent + "  ";
	int i = -1;
	if (sscanf(indent.c_str(), " %d", &i) == 1)
		return stringf("%*s%d> ", 40, "", i+2);
	return stringf("%*s%d> ", 40, "", GetSize(indent)+2);
#else
	return std::string();
#endif
}

struct EqyPartitionWorker
{
	std::vector<std::unique_ptr<Partition>> partitions;
	std::vector<std::vector<std::string>> rules;

	pool<SigBit> bind_database;
	pool<SigBit> solo_database;
	dict<SigBit, pool<SigBit>> group_database;
	dict<std::string, int> name_database;
	pool<SigBit> noamend_database;

	dict<SigBit, int> po_primitive_index;
	dict<SigBit, int> po_partition_index;
	dict<SigBit, pool<int>> pi_primitives_index;
	dict<SigBit, pool<int>> pi_partitions_index;

	Module *gold, *gate;
	SigMap gold_sigmap;
	SigMap gate_sigmap;
	FfInitVals gold_initvals;
	FfInitVals gate_initvals;

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

	Partition *partition(int index)
	{
		return partitions.at(index).get();
	}

	void check_integrity();

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

	EqyPartitionWorker(Module *gold, Module *gate) : gold(gold), gate(gate), gold_sigmap(gold),
			gate_sigmap(gate), gold_initvals(&gold_sigmap, gold), gate_initvals(&gate_sigmap, gate)
	{
		register_drivers(gold, gold_sigmap, gold_drivers);
		register_drivers(gate, gate_sigmap, gate_drivers);
	}

	void add_rule(const std::vector<std::string> &rule)
	{
		// Copy data from collect rules into local databases

		if (rule[0] == "group" && GetSize(rule) == 3) {
			SigSpec sig = gold_sigmap({gold->wire("\\" + rule[1]), gold->wire("\\" + rule[2])});
			sig.remove_const();
			for (int i = 1; i < GetSize(sig); i++) {
				group_database[sig[0]].insert(sig[i]);
				group_database[sig[i]].insert(sig[0]);
			}
			return;
		}

		if (rule[0] == "bind" && GetSize(rule) == 2) {
			for (SigBit bit : gold_sigmap(gold->wire("\\" + rule[1])))
				if (gold_drivers.count(bit))
					bind_database.insert(bit);
			return;
		}

		if (rule[0] == "join" && GetSize(rule) == 2) {
			SigSpec sig = gold_sigmap(gold->wire("\\" + rule[1]));
			sig.remove_const();
			for (int i = 1; i < GetSize(sig); i++) {
				group_database[sig[0]].insert(sig[i]);
				group_database[sig[i]].insert(sig[0]);
			}
			return;
		}

		if (rule[0] == "solo" && GetSize(rule) == 2) {
			for (SigBit bit : gold_sigmap(gold->wire("\\" + rule[1])))
				solo_database.insert(bit);
			return;
		}

		// Store partition rules for after the collect step is done
		rules.push_back(rule);
	}

	void add_match(SigBit gold_bit, SigBit gate_bit, std::string indent = "")
	{
		gold_bit = gold_sigmap(gold_bit);
		gate_bit = gate_sigmap(gate_bit);

		if (!gold_bit.wire)
			return;

		log_debug("%sbit match: %s <-> %s\n", indent.c_str(), log_signal(gold_bit), log_signal(gate_bit));

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

	void add_match(SigSpec gold_sig, SigSpec gate_sig, std::string indent = "")
	{
		log_debug("%ssignal match: %s <-> %s\n", indent.c_str(), log_signal(gold_sig), log_signal(gate_sig));
		for (int i = 0; i < GetSize(gold_sig) && i < GetSize(gate_sig); i++)
			add_match(gold_sig[i], gate_sig[i], increase_indent(indent));
	}

	void add_match(Cell *gold_cell, Cell *gate_cell, std::string indent = "")
	{
		if (gold_matched_cells.count(gold_cell) && gold_matched_cells.at(gold_cell) != gate_cell)
			log_error("conflicting matches for gold cell %s: %s vs %s\n", log_id(gold_cell),
					log_id(gold_matched_cells.at(gold_cell)), log_id(gate_cell));

		if (gate_matched_cells.count(gate_cell) && gate_matched_cells.at(gate_cell) != gold_cell)
			log_error("conflicting matches for gate cell %s: %s vs %s\n", log_id(gate_cell),
					log_id(gate_matched_cells.at(gate_cell)), log_id(gold_cell));

		gold_matched_cells[gold_cell] = gate_cell;
		gate_matched_cells[gate_cell] = gold_cell;

		log_debug("%scell match: %s <-> %s\n", indent.c_str(), log_id(gold_cell), log_id(gate_cell));

		for (auto &conn : gold_cell->connections())
			if (gate_cell->connections().count(conn.first))
				add_match(conn.second, gate_cell->connections().at(conn.first), increase_indent(indent));
	}

	void add_match(IdString gold_id, IdString gate_id, std::string indent = "")
	{
		log_debug("%sid match: %s <-> %s\n", indent.c_str(), log_id(gold_id), log_id(gate_id));

		Cell *gold_cell = gold->cell(gold_id);
		Cell *gate_cell = gate->cell(gate_id);

		if (gold_cell || gate_cell)
		{
			if (!gold_cell)
				log_error("Can't find cell %s in gold circuit.\n", log_id(gold_id));
			if (!gate_cell)
				log_error("Can't find cell %s in gate circuit.\n", log_id(gate_id));

			add_match(gold_cell, gate_cell, increase_indent(indent));
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

			add_match(SigSpec(gold_wire), SigSpec(gate_wire), increase_indent(indent));
			return;
		}
	}

	Partition *create_partition();
	void create_partitions();
	void merge_partitions();
	void finalize_partitions(std::ofstream &partition_list_file);
};

struct Partition
{
	vector<std::string> names;
	int name_priority = 0;

	EqyPartitionWorker *worker;
	pool<int> amend_with;
	int merged_into = -1;
	int index;

	// A 'finalized' partition has either been written to an output file, or was replaced
	// as partition to-be-written by merging it into another partition, making that other
	// partition responsible for proving the POs that used to belong to this partition.
	bool finalized = false;

	// A 'primitive' partition is the original partition for a PO (or a set of merged-early POs),
	// before merging partitions and/or importing gold data from one partition into another.
	bool primitive = false;

	// A 'marked final' partition should not be modified by any further [partition] commands.
	bool marked_final = false;

	pool<SigBit> inbits, outbits, crossbits;
	pool<SigBit> gold_bits, gate_bits;
	pool<Cell*> gold_cells, gate_cells;

	Partition(EqyPartitionWorker *worker) : worker(worker), index(GetSize(worker->partitions)) { }

	// Create a unique non-primitive clone of this partition and mark this partition as finalized.
	Partition *make_get_nonprimitive()
	{
		if (merged_into >= 0) {
			Partition *other = worker->partition(merged_into)->make_get_nonprimitive();
			merged_into = other->index;
			return other;
		}

		log_assert(!finalized);

		if (!primitive) return this;

		Partition *other = worker->create_partition();
		merged_into = other->index;
		finalized = true;

		log("  Cloning partition %d into non-primitive partition %d.\n", index, merged_into);

		other->names = names;
		other->name_priority = name_priority;
		other->amend_with = amend_with;

		other->inbits = inbits;
		other->outbits = outbits;
		log_assert(crossbits.empty());

		other->gold_bits = gold_bits;
		other->gate_bits = gate_bits;

		other->gold_cells = gold_cells;
		other->gate_cells = gate_cells;

		for (auto bit : inbits) {
			worker->pi_partitions_index[bit].erase(index);
			worker->pi_partitions_index[bit].insert(other->index);
		}
		for (auto bit : outbits) {
			worker->po_partition_index[bit] = other->index;
		}

		return other;
	}

	// Merge the other partition into this partition, and mark the other partiton as
	// finalized. POs of the other partiton become POs of this partition, potentially replacing
	// existing PIs of this partiton. PIs of the other partition becme PIs of this partition,
	// unless those nets already exist (as PIs, POs, or internal nets).
	void merge(Partition *other)
	{
		log_assert(!finalized);
		log_assert(!other->finalized);

		other->finalized = true;
		other->merged_into = index;

		if (other->name_priority) {
			if (name_priority && name_priority < other->name_priority) {
				names.insert(names.end(), other->names.begin(), other->names.end());
			} else {
				auto new_names = other->names;
				new_names.insert(new_names.end(), names.begin(), names.end());
				name_priority = other->name_priority;
				names = new_names;
			}
		}

		for (int p : other->amend_with)
			amend_with.insert(p);

		for (auto bit : other->inbits) {
			if (!gold_bits.count(bit))
				inbits.insert(bit);
		}

		for (auto bit : other->outbits) {
			if (inbits.count(bit)) {
				if (primitive) {
					worker->pi_primitives_index[bit].erase(index);
					if (worker->pi_primitives_index[bit].empty())
						worker->pi_primitives_index.erase(bit);
				}
				worker->pi_partitions_index[bit].erase(index);
				if (worker->pi_partitions_index[bit].empty())
					worker->pi_partitions_index.erase(bit);
				inbits.erase(bit);
			}
			outbits.insert(bit);
		}

		log_assert(crossbits.empty());
		log_assert(other->crossbits.empty());

		gold_bits.insert(other->gold_bits.begin(), other->gold_bits.end());
		gate_bits.insert(other->gate_bits.begin(), other->gate_bits.end());

		gold_cells.insert(other->gold_cells.begin(), other->gold_cells.end());
		gate_cells.insert(other->gate_cells.begin(), other->gate_cells.end());

		if (primitive && other->primitive) {
			for (auto bit : other->inbits) {
				worker->pi_primitives_index[bit].erase(other->index);
				if (worker->pi_primitives_index[bit].empty())
					worker->pi_primitives_index.erase(bit);
			}
		}
		for (auto bit : other->inbits) {
			worker->pi_partitions_index[bit].erase(other->index);
			if (worker->pi_partitions_index[bit].empty())
				worker->pi_partitions_index.erase(bit);
		}

		for (auto bit : inbits) {
			if (primitive)
				worker->pi_primitives_index[bit].insert(index);
			worker->pi_partitions_index[bit].insert(index);
		}
		for (auto bit : outbits) {
			if (primitive)
				worker->po_primitive_index[bit] = index;
			worker->po_partition_index[bit] = index;
		}
	}

	// Copy the gold netlist of the other partition into the gold netlist of this partition.
	// POs of the other partiton become "crossbits" nets of this partition, potentially replacing
	// existing PIs of this partiton. PIs of the other partition become PIs of this partition,
	// unless those nets already exist (as PIs, POs, or internal nets).
	void import(const Partition *other)
	{
		log_assert(!finalized);
		log_assert(other->primitive);

		for (auto bit : other->inbits) {
			if (!gold_bits.count(bit)) {
				inbits.insert(bit);
				gate_bits.insert(worker->gold_matches.at(bit));
			}
		}

		for (auto bit : other->outbits) {
			if (inbits.count(bit))
				inbits.erase(bit);
			auto gate_bit = worker->gold_matches.at(bit);
			auto gate_cell = get<0>(worker->gate_drivers.at(gate_bit));
			if (gate_cells.count(gate_cell) == 0) {
				crossbits.insert(bit);
				gate_bits.insert(gate_bit);
			}
		}

		log_assert(other->crossbits.empty());

		gold_bits.insert(other->gold_bits.begin(), other->gold_bits.end());
		gold_cells.insert(other->gold_cells.begin(), other->gold_cells.end());
	}

	void add(SigBit gold_bit)
	{
		pool<SigBit> found_matched_bits;
		gold_bit = worker->gold_sigmap(gold_bit);

		log_assert(primitive);
		log_assert(!finalized);
		log_assert(worker->queue.count(gold_bit));
		worker->queue.erase(gold_bit);

		std::function<void(SigBit,bool,bool,const std::string&)> add_bit_f;
		std::function<void(Cell*,bool,const std::string&)> add_cell_f;

		add_bit_f = [&](SigBit bit, bool in_gold, bool isoutput, const std::string &indent)->void
		{
			auto &gg_sigmap = in_gold ? worker->gold_sigmap : worker->gate_sigmap;
			auto &gg_drivers = in_gold ? worker->gold_drivers : worker->gate_drivers;
			auto &gg_matches = in_gold ? worker->gold_matches : worker->gate_matches;
			auto &gg_bits = in_gold ? gold_bits : gate_bits;

			bit = gg_sigmap(bit);

			if (!bit.wire)
				return;

			bool insert_bit = !gg_bits.count(bit);

			if (gg_matches.count(bit))
			{
				SigBit xx_bit = gg_matches.at(bit);
				SigBit gold_bit = in_gold ? bit : xx_bit;

				if (isoutput)
					insert_bit = true;
				if (outbits.count(gold_bit))
					isoutput = true;
			}

			bool isinput = false;
			bool run_other = false;

			if (insert_bit)
			{
				gg_bits.insert(bit);

				if (gg_matches.count(bit))
				{
					SigBit xx_bit = gg_matches.at(bit);
					SigBit gold_bit = in_gold ? bit : xx_bit;

					if (isoutput) {
						run_other = !outbits.count(gold_bit);
						outbits.insert(gold_bit);
						worker->po_primitive_index[gold_bit] = index;
						worker->po_partition_index[gold_bit] = index;
						if (inbits.count(gold_bit)) {
							inbits.erase(gold_bit);
							worker->pi_primitives_index[gold_bit].erase(index);
							if (worker->pi_primitives_index[gold_bit].empty())
								worker->pi_primitives_index.erase(gold_bit);
							worker->pi_partitions_index[gold_bit].erase(index);
							if (worker->pi_partitions_index[gold_bit].empty())
								worker->pi_partitions_index.erase(gold_bit);
						}
					} else if (!worker->bind_database.count(gold_bit)) {
						isinput = true;
						run_other = !inbits.count(gold_bit);
						inbits.insert(gold_bit);
						worker->pi_primitives_index[gold_bit].insert(index);
						worker->pi_partitions_index[gold_bit].insert(index);
					}
				}
				else
				{
					log_assert(!isoutput);
				}
			}

			log_debug("%sadd_bit_f %s %s%s%s: %s%s\n", indent.c_str(),
					log_signal(bit), in_gold ? "gold" : "gate",
					isoutput ? " [output]" : "", isinput ? " [input]" : "",
					insert_bit ? "insert" : "skip", run_other ? "+" : "");

			if (run_other) {
				SigBit xx_bit = gg_matches.at(bit);
				add_bit_f(xx_bit, !in_gold, isoutput, increase_indent(indent));
			}

			if (insert_bit && !isinput && gg_drivers.count(bit)) {
				auto const &driver = gg_drivers.at(bit);
				auto driver_cell = std::get<0>(driver);
				add_cell_f(driver_cell, in_gold, increase_indent(indent));
			}
		};

		add_cell_f = [&](Cell *cell, bool in_gold, const std::string &indent)->void
		{
			auto &gg_sigmap = in_gold ? worker->gold_sigmap : worker->gate_sigmap;
			auto &gg_matches = in_gold ? worker->gold_matches : worker->gate_matches;
			auto &gg_cells = in_gold ? gold_cells : gate_cells;
			bool insert_cell = !gg_cells.count(cell);

			log_debug("%sadd_cell_f %s %s: %s\n", indent.c_str(), log_id(cell),
					in_gold ? "gold" : "gate", insert_cell ? "insert" : "skip");

			if (!insert_cell)
				return;

			gg_cells.insert(cell);

			for (auto &conn : cell->connections()) {
				if (cell->input(conn.first))
					for (auto bit : conn.second)
						add_bit_f(bit, in_gold, false, increase_indent(indent));
				if (cell->output(conn.first))
					for (auto bit : gg_sigmap(conn.second))
						if (gg_matches.count(bit) && !worker->solo_database.count(bit))
							found_matched_bits.insert(in_gold ? bit : gg_matches.at(bit));
			}
		};

		log("Adding bit %s to partition %d.\n", log_signal(gold_bit), index);
		add_bit_f(gold_bit, true, true, "  ");

		pool<SigBit> empty = {};

		for (auto &bit : worker->aliases.at(worker->raliases.at(gold_bit, gold_bit), empty))
			if (!worker->solo_database.count(bit))
				found_matched_bits.insert(bit);

		if (worker->solo_database.count(gold_bit))
			found_matched_bits.clear();

		if (worker->group_database.count(gold_bit))
			for (auto &bit : worker->group_database.at(gold_bit))
				found_matched_bits.insert(bit);

		for (auto &bit : found_matched_bits) {
			if (worker->queue.count(bit))
				add(bit);
			else if (worker->po_primitive_index.count(bit)) {
				int idx = worker->po_primitive_index.at(bit);
				if (idx != index) {
					log("Adding bit %s to partition %d by merging partition %d.\n", log_signal(bit), index, idx);
					merge(worker->partition(idx));
				}
			}
		}
	}

	Design *finalize(IdString partname, const std::string &json_filename)
	{
		log_assert(!finalized);
		finalized = true;

		log("Finalizing partition %d as %s.\n", index, log_id(partname));

		std::ofstream json_file(json_filename.c_str(), std::ofstream::trunc);
		json_file << stringf("{\n");
		json_file << stringf("  \"partition\": {\n");
		json_file << stringf("    \"index\": %d,\n", index);
		json_file << stringf("    \"name\": \"%s\",\n", log_id(partname));

		dict<std::string, pool<int>> json_bits;
		auto write_json_bits = [&](const char *name, bool last = false)->void {
			json_file << stringf("    \"%s\": {\n", name);
			json_bits.sort();
			bool first = true;
			for (auto &it : json_bits) {
				if (!first) json_file << ",\n";
				json_file << stringf("      \"%s\": [", it.first.c_str());
				it.second.sort();
				for (int i : it.second) {
					if (i != *it.second.begin())
						json_file << ", ";
					json_file << i;
				}
				json_file << "]";
				first = false;
			}
			json_bits.clear();
			json_file << stringf("\n    }%s\n", last ? "" : ",");
		};

		for (auto &bit : inbits)
			json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
		write_json_bits("inbits");

		for (auto &bit : outbits)
			json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
		write_json_bits("outbits");

		for (auto &bit : crossbits)
			json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
		write_json_bits("crossbits", true);

		json_file << stringf("  },\n");

		Design *partdesign = new Design();

		Module *mod_gold = partdesign->addModule("\\gold." + partname.substr(1));
		Module *mod_gate = partdesign->addModule("\\gate." + partname.substr(1));

		auto copy_mod_contents = [&](bool in_gold, const SigSpec &pi, const SigSpec &po, const SigSpec &cp, const SigSig &conn)->void
		{
			json_file << stringf("  \"%s_module\": {\n", in_gold ? "gold" : "gate");
			json_file << stringf("    \"name\": \"%s\",\n", log_id(mod_gold));

			// Module *in_mod = in_gold ? gold : gate;
			Module *out_mod = in_gold ? mod_gold : mod_gate;
			auto &sigmap = in_gold ? worker->gold_sigmap : worker->gate_sigmap;
			auto &initvals = in_gold ? worker->gold_initvals : worker->gate_initvals;

			auto &gg_bits = in_gold ? gold_bits : gate_bits;
			auto &gg_cells = in_gold ? gold_cells : gate_cells;

			dict<SigBit,SigBit> mapped_bits;
			dict<Wire*,Wire*> mapped_wires;

			pool<SigBit> pio_bits;
			pio_bits.insert(pi.begin(), pi.end());
			pio_bits.insert(po.begin(), po.end());
			pio_bits.insert(cp.begin(), cp.end());

			for (auto bit : gg_bits) {
				Wire *w = bit.wire;
				if (!w) continue;
				log_debug("  %s partition bit: %s\n", in_gold ? "gold" : "gate", log_signal(bit));
				if (!mapped_wires.count(w)) {
					Wire *ww = out_mod->addWire(w->name, GetSize(w));
					log_debug("  %s partition wire: %s\n", in_gold ? "gold" : "gate", log_id(w));
					// TBD: Copy some of the wire metadata
					mapped_wires[w] = ww;
				}
				if (w->name.isPublic() && !pio_bits.count(bit))
					json_bits[unescape_id(w->name)].insert(bit.offset);
				mapped_bits[bit] = SigBit(mapped_wires.at(w), bit.offset);
			}
			write_json_bits("internal");

			for (auto &it : mapped_wires) {
				Wire *w = it.first, *ww = it.second;
				for (int i = 0; i < GetSize(w); i++)
					if (!mapped_bits.count(SigBit(w, i)))
						out_mod->connect(SigBit(ww, i), State::Sz);
			}

			for (int i = 0; i < GetSize(conn.first); i++)
				out_mod->connect(mapped_bits.at(conn.first[i]), conn.second[i].wire ? mapped_bits.at(conn.second[i]) : conn.second[i]);

			SigMap out_sigmap(out_mod);
			FfInitVals out_initvals(&out_sigmap, out_mod);

			for (auto c : gg_cells)
			{
				Cell *cc = out_mod->addCell(c->name, c->type);
				log_debug("  %s partition cell: %s\n", in_gold ? "gold" : "gate", log_id(cc));
				// TBD: Copy some of the cell metadata
				cc->parameters = c->parameters;

				bool is_reg = RTLIL::builtin_ff_cell_types().count(c->type);
				for (auto &conn : c->connections()) {
					SigSpec s;
					int bit_index = 0;
					for (auto bit : sigmap(conn.second)) {
						SigBit out_bit;
						if (bit.wire == nullptr)
							out_bit = bit;
						else if (c->output(conn.first) && inbits.count(in_gold ? bit :
								worker->gate_matches.at(bit, bit)))
							out_bit = out_mod->addWire(NEW_ID);
						else if (mapped_bits.count(bit))
							out_bit = mapped_bits.at(bit);
						else
							out_bit = out_mod->addWire(NEW_ID);
						s.append(out_bit);
						if (is_reg && conn.first == ID::Q && out_bit.is_wire())
							out_initvals.set_init(out_bit, initvals(bit));
						bit_index++;
					}
					log_debug("    port %s: %s => %s => %s\n", log_id(conn.first), log_signal(conn.second),
							log_signal(sigmap(conn.second)), log_signal(s));
					cc->setPort(conn.first, s);
				}
			}

			json_file << stringf("    \"cellcount\": %d,\n", GetSize(gg_cells));
			json_file << stringf("    \"bitcount\": %d\n", GetSize(gg_bits));
			json_file << stringf("  }%s\n", in_gold ? "," : "");

			SigSpec out_pi, out_po, out_cp;
			for (auto bit : sigmap(pi))
				out_pi.append(bit.is_wire() ? mapped_bits.at(bit) : bit);
			for (auto bit : sigmap(po))
				out_po.append(bit.is_wire() ? mapped_bits.at(bit) : bit);
			for (auto bit : sigmap(cp))
				out_cp.append(bit.is_wire() ? mapped_bits.at(bit) : bit);

			int port_idx = 0;

			if (GetSize(pi)) {
				Wire *piw = out_mod->addWire("\\__pi", GetSize(pi));
				piw->port_input = true;
				piw->port_id = ++port_idx;
				out_mod->connect(out_pi, piw);
			}

			if (GetSize(po)) {
				Wire *pow = out_mod->addWire("\\__po", GetSize(po));
				pow->port_output = true;
				pow->port_id = ++port_idx;
				out_mod->connect(pow, out_po);
			}

			if (GetSize(cp)) {
				Wire *cpw = out_mod->addWire("\\__cp", GetSize(po));
				cpw->port_output = in_gold;
				cpw->port_input = !in_gold;
				cpw->port_id = ++port_idx;
				if (in_gold)
					out_mod->connect(cpw, out_cp);
				else
					out_mod->connect(out_cp, cpw);
			}

			out_mod->fixup_ports();
		};

		dict<SigBit, int> gate_pi_positions;

		SigSpec gold_pi, gold_po, gold_cp, gate_pi, gate_po, gate_cp;
		SigSig gold_conn, gate_conn;

		for (auto bit : inbits)
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

		for (auto bit : outbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			log("  partition po bit %d: %s <-> %s\n", GetSize(gold_po), log_signal(bit), log_signal(gate_bit));
			gold_po.append(bit);
			gate_po.append(gate_bit);
		}

		for (auto bit : crossbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			log("  partition cp bit %d: %s <-> %s\n", GetSize(gold_cp), log_signal(bit), log_signal(gate_bit));
			gold_cp.append(bit);
			gate_cp.append(gate_bit);
		}

		copy_mod_contents(true, gold_pi, gold_po, gold_cp, gold_conn);
		copy_mod_contents(false, gate_pi, gate_po, gate_cp, gate_conn);

		json_file << stringf("}\n");
		return partdesign;
	}
};

void EqyPartitionWorker::check_integrity()
{
	log_debug("CHECKING DATABASE INTEGRITY\n");

	dict<SigBit, int> new_po_primitive_index;
	dict<SigBit, int> new_po_partition_index;
	dict<SigBit, pool<int>> new_pi_primitives_index;
	dict<SigBit, pool<int>> new_pi_partitions_index;

	for (int idx = 0; idx < GetSize(partitions); idx++) {
		auto p = partition(idx);

		if (p->primitive && (p->merged_into == -1 || !partition(p->merged_into)->primitive)) {
			for (auto bit : p->outbits) {
				log_assert(!new_po_primitive_index.count(bit));
				new_po_primitive_index[bit] = p->index;
			}
			for (auto bit : p->inbits)
				new_pi_primitives_index[bit].insert(p->index);
		}

		if (!p->finalized) {
			for (auto bit : p->outbits) {
				log_assert(!new_po_partition_index.count(bit));
				new_po_partition_index[bit] = p->index;
			}
			for (auto bit : p->inbits)
				new_pi_partitions_index[bit].insert(p->index);
		}
	}

#if 0
	po_primitive_index.sort();
	new_po_primitive_index.sort();
	log_dump(po_primitives_index);
	log_dump(new_po_primitives_index);
#endif
	log_assert(new_po_primitive_index == po_primitive_index);

#if 0
	po_partition_index.sort();
	new_po_partition_index.sort();
	log_dump(po_partition_index);
	log_dump(new_po_partition_index);
#endif
	log_assert(new_po_partition_index == po_partition_index);

#if 0
	pi_primitives_index.sort();
	new_pi_primitives_index.sort();
	for (auto &it : pi_primitives_index) it.second.sort();
	for (auto &it : new_pi_primitives_index) it.second.sort();
	log_dump(pi_primitives_index);
	log_dump(new_pi_primitives_index);
#endif
	log_assert(new_pi_primitives_index == pi_primitives_index);

#if 0
	pi_partitions_index.sort();
	new_pi_partitions_index.sort();
	for (auto &it : pi_partitions_index) it.second.sort();
	for (auto &it : new_pi_partitions_index) it.second.sort();
	log_dump(pi_partitions_index);
	log_dump(new_pi_partitions_index);
#endif
	log_assert(new_pi_partitions_index == pi_partitions_index);

	log_debug("DATABASE INTEGRITY CHECKS PASSED\n");
}

Partition *EqyPartitionWorker::create_partition()
{
	partitions.push_back(std::unique_ptr<Partition>(new Partition(this)));
	return partitions.back().get();
}

void EqyPartitionWorker::create_partitions()
{
	while (!queue.empty()) {
		SigBit gold_bit = *queue.begin();
		Partition *partition = create_partition();
		partition->primitive = true;
		partition->add(gold_bit);
	}

	log_spacer();
	log("Final list of primitive partitions:\n");
	for (int i = 0; i < GetSize(partitions); i++) {
		auto p = partition(i);
		if (p->finalized) continue;
		log("  %d", i);
		for (auto bit : p->outbits)
			log(" %s", log_signal(bit));
		log(" <=");
		for (auto bit : p->inbits)
			log(" %s", log_signal(bit));
		log("\n");
	}
}

void EqyPartitionWorker::merge_partitions()
{
	int name_priority = 0;

	for (auto &rule : rules) {
		std::string message = "Executing rule '";
		for (int i = 0; i < GetSize(rule); i++)
			message += (i ? " " : "") + rule[i];
		log("%s'.\n", message.c_str());

		if (rule[0] == "name" && GetSize(rule) == 3) {
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_partition_index.count(bit))
					continue;
				auto p = partition(po_partition_index.at(bit));
				log_assert(!p->finalized);
				log("  PO bit %s belongs to partition %d\n", log_signal(bit), p->index);
				if (p->marked_final) {
					log("    Skipping partition marked final.\n");
					continue;
				}
				if (name_database.count(rule[2])) {
					auto target = partition(name_database.at(rule[2]))->make_get_nonprimitive();
					if (target->marked_final) {
						log("    Skipping previously named partition %d that is marked final.\n", target->index);
						continue;
					}
					log("    Merging with previously named partition %d.\n", target->index);
					target->merge(p);
				} else {
					if (!p->name_priority)
						p->name_priority = ++name_priority;
					name_database[rule[2]] = p->index;
					p->names.push_back(rule[2]);
				}
			}
			continue;
		}

		if (rule[0] == "merge" && GetSize(rule) == 3) {
			Partition *first = nullptr;
			for (auto bit : gold_sigmap({gold->wire("\\" + rule[1]), gold->wire("\\" + rule[2])})) {
				if (!po_partition_index.count(bit))
					continue;
				auto p = partition(po_partition_index.at(bit));
				log_assert(!p->finalized);
				log("  PO bit %s belongs to partition %d\n", log_signal(bit), p->index);
				if (p->marked_final) {
					log("    Skipping partition marked final.\n");
					continue;
				}
				if (first == nullptr) {
					first = p->make_get_nonprimitive();
					log("    Using partition %d as merge target.\n", first->index);
				} else {
					log("    Merging partition %d into partition %d.\n", p->index, first->index);
					first->merge(p);
				}
			}
			continue;
		}

		if (rule[0] == "path" && GetSize(rule) == 3) {
			// TBD
		}

		if (rule[0] == "sticky" && GetSize(rule) == 2) {
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_partition_index.count(bit))
					continue;
				auto generator = partition(po_partition_index.at(bit))->make_get_nonprimitive();
				log_assert(!generator->finalized);
				log("  PO bit %s belongs to partition %d\n", log_signal(bit), generator->index);
				if (generator->marked_final) {
					log("    Skipping partition marked final.\n");
					continue;
				}
				for (int idx : pi_partitions_index.at(bit, {})) {
					if (partition(idx)->marked_final) {
						log("    Skipping PI partition %d as it is marked final.\n", idx);
						continue;
					}
					log("    Merging with PI partition %d.\n", idx);
					generator->merge(partition(idx));
				}
			}
			continue;
		}

		if (rule[0] == "amend" && (GetSize(rule) == 2 || GetSize(rule) == 3)) {
			SigSpec match_sig = GetSize(rule) == 3 ? gold_sigmap(gold->wire("\\" + rule[2])) : SigSpec();
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_primitive_index.count(bit))
					continue;
				auto generator = partition(po_primitive_index.at(bit));
				log_assert(generator->primitive);
				log("  PO bit %s belongs to primitive partition %d\n", log_signal(bit), generator->index);
				for (int idx : pi_partitions_index.at(bit, {})) {
					auto p = partition(idx);
					if (p->marked_final) {
						log("    Skipping PI partition %d as it is marked final.\n", idx);
						continue;
					}
					if (GetSize(rule) == 3) {
						bool found_bit = false;
						for (auto match_bit : match_sig)
							found_bit |= p->gold_bits.count(match_bit);
						if (!found_bit) {
							log("    Skipping PI partition %d as it doesn't match the condition signal.\n", idx);
						}
					}
					p = p->make_get_nonprimitive();
					log("    Amending PI partition %d.\n", p->index);
					p->amend_with.insert(generator->index);
				}
			}
			continue;
		}

		if (rule[0] == "noamend" && GetSize(rule) == 2) {
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_partition_index.count(bit))
					continue;
				noamend_database.insert(bit);
			}
			continue;
		}

		if (rule[0] == "final" && GetSize(rule) == 2) {
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_partition_index.count(bit))
					continue;
				auto p = partition(po_partition_index.at(bit));
				log_assert(!p->finalized);
				p->marked_final = true;
			}
			continue;
		}

		message = "Malformed partition rule:";
		for (auto &word : rule)
			message += " " + word;
		log_error("%s\n", message.c_str());
	}

	log("Find additional automatic amend rules.\n");
	for (int idx = 0; idx < GetSize(partitions); idx++) {
		auto p = partition(idx);
		if (!p->finalized) continue;

		log("Checking partition %d:\n", p->index);

		pool<int> po_candidates, pi_candidates;
		for (auto bit : p->inbits) {
			if (noamend_database.count(bit))
				continue;

			if (po_primitive_index.count(bit)) {
				int pidx = po_primitive_index.at(bit);
				log_debug("  partition %d is a PO candidate: %s\n", pidx, log_signal(bit));
				po_candidates.insert(pidx);
			}

			if (pi_primitives_index.count(bit))
				for (auto pidx : pi_primitives_index.at(bit)) {
					log_debug("  partition %d is a PI candidate: %s\n", pidx, log_signal(bit));
					pi_candidates.insert(pidx);
				}
		}

		log("  Found %d po candidates and %d pi candidates.\n", GetSize(po_candidates), GetSize(pi_candidates));

		for (auto pidx : po_candidates) {
			if (!pi_candidates.count(pidx))
				continue;

			pool<SigBit> matched_pis, matched_pos;
			auto prim = partition(pidx);

			for (auto bit : prim->inbits)
				if (p->inbits.count(bit)) matched_pis.insert(bit);

			for (auto bit : prim->outbits)
				if (p->inbits.count(bit)) matched_pos.insert(bit);
			log_assert(prim->crossbits.empty());

			log("    Amending with partition %d (%d pi matches and %d po matches).\n", pidx, GetSize(matched_pis), GetSize(matched_pos));
			p->amend_with.insert(prim->index);
			log_assert(!matched_pis.empty());
			log_assert(!matched_pos.empty());

			for (auto bit : matched_pis)
				log_debug("      PI: %s\n", log_signal(bit));
			for (auto bit : matched_pos)
				log_debug("      PO: %s\n", log_signal(bit));
		}
	}

	// actually amend now, after the regular merge operations are all done
	log("Execute queued amend rules.\n");
	for (int idx = 0; idx < GetSize(partitions); idx++) {
		auto p = partition(idx);
		if (!p->finalized && !p->amend_with.empty()) {
			auto p = partition(idx)->make_get_nonprimitive();
			if (p->index == idx)
				for (auto q : p->amend_with)
					p->import(partition(q));
		}
	}

	// automatically name remaining partitions
	dict<Wire*,int> wire_score;
	dict<SigBit,int> bit_score;
	for (auto &it : pi_partitions_index) {
		auto bit = it.first;

		if (!wire_score.count(bit.wire))
			wire_score[bit.wire] = GetSize(bit.wire->name);
		wire_score[bit.wire] -= GetSize(it.second);

		if (!bit_score.count(bit))
			bit_score[bit] = GetSize(bit.wire->name);
		bit_score[bit] -= GetSize(it.second);
	}
	for (auto &it : partitions)
	{
		Partition *partition = it.get();
		if (partition->finalized || partition->name_priority) continue;

		log_debug("Automatically naming partition %d:\n", partition->index);

		dict<Wire*,int> wire_bits;
		for (auto bit : partition->outbits) {
			wire_bits[bit.wire] += 1;
		}

		auto mangle_name = [](const std::string &s)->std::string {
			std::string r;
			for (char c : s) {
				if ('a' <= c && c <= 'z') r += c;
				if ('A' <= c && c <= 'Z') r += c;
				if ('0' <= c && c <= '9') r += c;
				if ('.' == c || c == '_') r += c;
			}
			return r;
		};

		vector<tuple<int,std::string,std::string>> candidates;
		for (auto bit : partition->outbits) {
			if (bit.wire->width < 2*wire_bits[bit.wire]) {
				std::string name = unescape_id(bit.wire->name);
				int score = wire_score[bit.wire];
				log_debug("  candidate output wire with score %d: %s\n", score, log_signal(bit));
				candidates.push_back(make_tuple(score, mangle_name(name), name));
			} else {
				std::string name = stringf("%s[%d]", unescape_id(bit.wire->name).c_str(), bit.offset);
				int score = bit_score[bit];
				log_debug("  candidate output bit with score %d: %s\n", score, log_signal(bit));
				candidates.push_back(make_tuple(bit_score[bit], mangle_name(name), name));
			}
		}

		std::sort(candidates.begin(), candidates.end());

		for (auto &it : candidates) {
			if (name_database.count(std::get<1>(it))) {
				log_debug("  name '%s' is already taken\n", std::get<1>(it).c_str());
				continue;
			}

			log("Automatically naming partition %d '%s' using a PO name: %s\n", partition->index, std::get<1>(it).c_str(), std::get<2>(it).c_str());
			partition->name_priority = ++name_priority;
			name_database[std::get<1>(it)] = partition->index;
			partition->names.push_back(std::get<1>(it));
			break;
		}
	}
}

void EqyPartitionWorker::finalize_partitions(std::ofstream &partition_list_file)
{
	for (auto &it : partitions)
	{
		Partition *partition = it.get();
		if (partition->finalized) continue;

		std::string partname = partition->name_priority ?
				stringf("%s.%s", gold->name.substr(6).c_str(), partition->names.front().c_str()) :
				stringf("%s#%d", gold->name.substr(6).c_str(), partition->index);
		std::string filename = stringf("partitions/%s.il", partname.c_str());
		std::string json_filename = stringf("partitions/%s.json", partname.c_str());

		IdString partid = "\\" + partname;
		Design *partdesign = partition->finalize(partid, json_filename);

		pool<SigBit> unused_gold_inputs = partition->inbits;
		for (auto cell : partition->gold_cells)
			for (auto conn : cell->connections())
				for (auto bit : gold_sigmap(conn.second))
					if (unused_gold_inputs.count(bit))
						unused_gold_inputs.erase(bit);

		partition_list_file << unescape_id(gold->name).substr(5) << " ";
		partition_list_file << partname;

		bool has_memory = false;
		for (auto module : partdesign->modules()) {
			if (!has_memory)
				has_memory = !Mem::get_all_memories(module).empty();
		}

		if (has_memory)
			partition_list_file << " memory";

		partition_list_file << " :";
		SigSpec outsig(partition->outbits);
		outsig.sort();

		for (auto chunk : outsig.chunks())
			if (chunk.offset == 0 && chunk.width == chunk.wire->width != 1)
				partition_list_file << stringf(" %s", unescape_id(chunk.wire->name).c_str());
			else if (chunk.width == 1)
				partition_list_file << stringf(" %s[%d]", unescape_id(chunk.wire->name).c_str(), chunk.offset);
			else
				partition_list_file << stringf(" %s[%d:%d]", unescape_id(chunk.wire->name).c_str(), chunk.offset+chunk.width-1, chunk.offset);

		partition_list_file << "\n";

		Backend::backend_call(partdesign, nullptr, filename, "rtlil");
		partdesign->check();
		Pass::call(partdesign, "check -assert -initdrv");
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
			const dict<std::string, std::vector<std::vector<std::string>>> &partiton_ids,
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
				log_push();
				if (full_module_mode) {
					partition_full_module_worker(gold, gate);
				} else {
					EqyPartitionWorker worker(gold, gate);

					// Register match points
					log_header(design, "Processing matched IDs for module %s.\n", gold->name.substr(6).c_str());
					if (!matched_ids.count(gold->name.substr(6)))
						log_error("No matched IDs for module %s.\n", gold->name.substr(6).c_str());
					for (auto &it : matched_ids.at(gold->name.substr(6)))
						worker.add_match(IdString(RTLIL::escape_id(it.first)), IdString(RTLIL::escape_id(it.second)));

					// Force ports to be match points
					for (auto w : gold->wires())
						if (w->port_id)
							worker.add_match(w->name, w->name);

					if (partiton_ids.count(gold->name.substr(6)))
						for (auto line : partiton_ids.at(gold->name.substr(6)))
							worker.add_rule(line);

#if 0
					log_header(design, "Collect databases for module %s:\n", gold->name.substr(6).c_str());
					for (auto &bit : worker.bind_database) {
						log("bind %s\n", log_signal(bit));
					}
					for (auto &bit : worker.solo_database) {
						log("solo %s\n", log_signal(bit));
					}
					for (auto &it : worker.group_database) {
						log("group %s:", log_signal(it.first));
						for (auto &bit : it.second)
							log(" %s", log_signal(bit));
						log("\n");
					}
#endif

					log_header(design, "Create primitive partitions for module %s.\n", gold->name.substr(6).c_str());
					worker.create_partitions();
					worker.check_integrity();

					log_header(design, "Execute partitioning commands for module %s.\n", gold->name.substr(6).c_str());
					worker.merge_partitions();
					//worker.check_integrity();

					log_header(design, "Finalize partitions for module %s.\n", gold->name.substr(6).c_str());
					worker.finalize_partitions(partition_list_file);
				}
				log_pop();
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
			if (things.size() == 0 || things[0] == "#")
				continue;
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
					things[0] == "path" || things[0] == "amend") && GetSize(things) == 4) {
				partition_ids[things[1]].push_back({things[0], things[2], things[3]});
				continue;
			}
			if ((things[0] == "bind" || things[0] == "sticky" || things[0] == "join" || things[0] == "solo" ||
					things[0] == "final" || things[0] == "amend" || things[0] == "noamend") && GetSize(things) == 3) {
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

		// TBD: handle absent arguments
		auto matched_ids = read_matched_ids(matched_ids_filename);
		auto partition_ids = read_partition_ids(partition_ids_filename);
		std::ofstream partition_list_file(partition_list_filename, std::ofstream::out);

		log_push();
		partition_worker(design, full_module_mode, matched_ids, partition_ids, partition_list_file);
		log_pop();
	}
} EqyPartitionPass;

PRIVATE_NAMESPACE_END
