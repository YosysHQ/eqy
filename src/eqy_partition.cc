/*
Equivalence Checking with Yosys (eqy)

Copyright (C) 2020 Claire Xenia Wolf <claire@yosyshq.com>
Copyright (C) 2020 N. Engelhardt <nak@yosyshq.com>

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

	pool<SigBit> amend_database;
	pool<SigBit> noamend_database;

	dict<SigBit, int> po_fragment_index;
	dict<SigBit, int> po_partition_index;
	dict<SigBit, pool<int>> pi_fragments_index;
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

	std::vector<tuple<int, SigBit, SigBit>> grouped_matches;
	pool<std::pair<IdString, IdString>> match_group_names;

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

		if (rule[0] == "group" && GetSize(rule) >= 2) {
			SigBit firstBit;
			bool foundFirstBit = false;
			for (int i = 1; i < GetSize(rule); i++) {
				SigSpec sig = gold_sigmap(gold->wire("\\" + rule[i]));
				sig.remove_const();
				for (auto bit : sig) {
					if (!queue.count(bit))
						continue;
					if (foundFirstBit) {
						group_database[firstBit].insert(bit);
						group_database[bit].insert(firstBit);
					} else {
						firstBit = bit;
						foundFirstBit = true;
					}
				}
			}
			return;
		}

		if (rule[0] == "bind" && GetSize(rule) == 2) {
			for (SigBit bit : gold_sigmap(gold->wire("\\" + rule[1])))
				if (gold_drivers.count(bit))
					bind_database.insert(bit);
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

		grouped_matches.push_back({match_group_names.size() - 1, gold_bit, gate_bit});

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
		auto group = std::make_pair(gold_id, gate_id);
		if (match_group_names.count(group))
			return;
		match_group_names.insert(group);

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
	Partition *create_full_partition();

	void create_partitions();
	void merge_partitions();
	void write(bool fragments);
};

struct Partition
{
	vector<std::string> names;
	int name_priority = 0;

	EqyPartitionWorker *worker;
	pool<int> amend_with;
	int merged_into = -1;
	int index;

	pool<int> info_merged_hier;
	pool<int> info_merged_flat;
	pool<int> info_amended;

	// A 'superseded' partition was replaced by merging it into another partition, making that
	// other partition responsible for proving the POs that used to belong to this partition.
	bool superseded = false;

	// A 'fragment' partition is the original partition for a PO (or a set of merged-early POs),
	// before merging partitions and/or importing gold data from one partition into another.
	bool fragment = false;

	// A 'marked final' partition should not be modified by any further [partition] commands.
	bool marked_final = false;

	// A special partition that contains everything, mostly for debugging
	bool full_part = false;

	pool<SigBit> inbits, outbits, crossbits;
	pool<SigBit> gold_bits, gate_bits;
	pool<Cell*> gold_cells, gate_cells;

	pool<SigBit> amended_bits;
	pool<Cell*> amended_cells;

	Partition(EqyPartitionWorker *worker) : worker(worker), index(GetSize(worker->partitions)) { }

	bool active_fragment()
	{
		return fragment && (merged_into == -1 || !worker->partition(merged_into)->fragment);
	}

	// Create a unique non-fragment clone of this partition and mark this partition as superseded.
	Partition *make_get_nonfragment()
	{
		if (merged_into >= 0) {
			Partition *other = worker->partition(merged_into)->make_get_nonfragment();
			merged_into = other->index;
			return other;
		}

		log_assert(!superseded);
		log_assert(!full_part);

		if (!fragment)
			return this;

		Partition *other = worker->create_partition();
		merged_into = other->index;
		superseded = true;

		other->info_merged_hier.insert(index);
		other->info_merged_flat.insert(index);
		other->info_merged_flat.insert(info_merged_flat.begin(), info_merged_flat.end());

		log("  Cloning partition %d into non-fragment partition %d.\n", index, merged_into);

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
	// superseded. POs of the other partiton become POs of this partition, potentially replacing
	// existing PIs of this partiton. PIs of the other partition becme PIs of this partition,
	// unless those nets already exist (as PIs, POs, or internal nets).
	void merge(Partition *other)
	{
		log_assert(!superseded);
		log_assert(!other->superseded);

		log_assert(!full_part);
		log_assert(!other->full_part);

		other->superseded = true;
		other->merged_into = index;

		info_merged_hier.insert(other->index);
		info_merged_flat.insert(other->index);
		info_merged_flat.insert(other->info_merged_flat.begin(), other->info_merged_flat.end());

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
				if (fragment) {
					worker->pi_fragments_index[bit].erase(index);
					if (worker->pi_fragments_index[bit].empty())
						worker->pi_fragments_index.erase(bit);
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

		if (fragment && other->fragment) {
			for (auto bit : other->inbits) {
				worker->pi_fragments_index[bit].erase(other->index);
				if (worker->pi_fragments_index[bit].empty())
					worker->pi_fragments_index.erase(bit);
			}
		}
		for (auto bit : other->inbits) {
			worker->pi_partitions_index[bit].erase(other->index);
			if (worker->pi_partitions_index[bit].empty())
				worker->pi_partitions_index.erase(bit);
		}

		for (auto bit : inbits) {
			if (fragment)
				worker->pi_fragments_index[bit].insert(index);
			worker->pi_partitions_index[bit].insert(index);
		}
		for (auto bit : outbits) {
			if (fragment)
				worker->po_fragment_index[bit] = index;
			worker->po_partition_index[bit] = index;
		}
	}

	// Copy the gold netlist of the other partition into the gold netlist of this partition.
	// POs of the other partiton become "crossbits" nets of this partition, potentially replacing
	// existing PIs of this partiton. PIs of the other partition become PIs of this partition,
	// unless those nets already exist (as PIs, POs, or internal nets).
	void import(const Partition *other)
	{
		log_assert(!superseded);
		log_assert(other->fragment);

		log_assert(!full_part);
		log_assert(!other->full_part);

		info_amended.insert(other->index);

		for (auto bit : other->inbits) {
			if (!gold_bits.count(bit)) {
				inbits.insert(bit);
				gate_bits.insert(worker->gold_matches.at(bit));
			}
		}

		for (auto bit : other->outbits) {
			if (outbits.count(bit))
				continue;
			if (inbits.count(bit))
				inbits.erase(bit);
			auto gate_bit = worker->gold_matches.at(bit);
		#if 0
			crossbits.insert(bit);
			gate_bits.insert(gate_bit);
		#else
			auto gate_cell = get<0>(worker->gate_drivers.at(gate_bit));
			if (gate_cells.count(gate_cell) == 0) {
				crossbits.insert(bit);
				gate_bits.insert(gate_bit);
			}
		#endif
		}

		log_assert(other->crossbits.empty());

		for (auto bit : other->gold_bits) {
			if (gold_bits.count(bit))
				continue;
			gold_bits.insert(bit);
			amended_bits.insert(bit);
		}

		for (auto cell : other->gold_cells) {
			if (gold_cells.count(cell))
				continue;
			gold_cells.insert(cell);
			amended_cells.insert(cell);
		}
	}

	void add(SigBit gold_bit)
	{
		pool<SigBit> found_matched_bits;
		gold_bit = worker->gold_sigmap(gold_bit);

		log_assert(!superseded);
		log_assert(full_part || fragment);
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
						worker->queue.erase(gold_bit);
						if (!full_part) {
							worker->po_fragment_index[gold_bit] = index;
							worker->po_partition_index[gold_bit] = index;
						}
						if (inbits.count(gold_bit)) {
							inbits.erase(gold_bit);
							if (!full_part) {
								worker->pi_fragments_index[gold_bit].erase(index);
								if (worker->pi_fragments_index[gold_bit].empty())
									worker->pi_fragments_index.erase(gold_bit);
								worker->pi_partitions_index[gold_bit].erase(index);
								if (worker->pi_partitions_index[gold_bit].empty())
									worker->pi_partitions_index.erase(gold_bit);
							}
						}
					} else if (full_part ? !worker->gold_drivers.count(gold_bit) :
							!worker->bind_database.count(gold_bit)) {
						isinput = true;
						run_other = !inbits.count(gold_bit);
						inbits.insert(gold_bit);
						if (!full_part) {
							worker->pi_fragments_index[gold_bit].insert(index);
							worker->pi_partitions_index[gold_bit].insert(index);
						}
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
				if (!full_part && cell->output(conn.first))
					for (auto bit : gg_sigmap(conn.second))
						if (gg_matches.count(bit) && !worker->solo_database.count(bit))
							found_matched_bits.insert(in_gold ? bit : gg_matches.at(bit));
			}
		};

		bool isoutput = !full_part || gold_bit.wire->port_output;
		log("Adding %soutput bit %s to partition %d.\n", isoutput ? "" : "non-", log_signal(gold_bit), index);
		add_bit_f(gold_bit, true, isoutput, stringf("p%d>  ", index));
		if (!isoutput)
			add_bit_f(worker->gold_matches.at(gold_bit), false, false, stringf("p%d>  ", index));

		if (!full_part)
		{
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
				else if (worker->po_fragment_index.count(bit)) {
					int idx = worker->po_fragment_index.at(bit);
					if (idx != index) {
						log("Adding bit %s to partition %d by merging partition %d.\n", log_signal(bit), index, idx);
						merge(worker->partition(idx));
					}
				}
			}
		}
	}

	Design *write(IdString partname, const std::string &filename_prefix, bool &xbits_partition, bool fragment = false)
	{
		xbits_partition = false;

		log("Writing %s %d as %s.\n", fragment ? "fragment" : "partition", index, log_id(partname));

		std::ofstream json_file((filename_prefix + ".json").c_str(), std::ofstream::trunc);
		json_file << stringf("{\n");
		json_file << stringf("  \"%s\": {\n", fragment ? "fragment" : "partition");
		json_file << stringf("    \"index\": %d,\n", index);
		json_file << stringf("    \"name\": \"%s\",\n", log_id(partname));

		dict<std::string, pool<int>> json_bits;
		auto write_json_bits = [&](const char *name, bool last = false)->void {
			json_file << stringf("    \"%s\": {\n", name);
			json_bits.sort();
			bool first = true;
			for (auto &it : json_bits) {
				if (!first)
					json_file << ",\n";
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
			json_file << stringf("%s    }%s\n", json_bits.empty() ? "" : "\n", last ? "" : ",");
			json_bits.clear();
		};

		for (auto &bit : inbits)
			json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
		write_json_bits("inbits");

		for (auto &bit : outbits)
			json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
		write_json_bits("outbits", fragment);

		if (fragment) {
			log_assert(crossbits.empty());
		} else {
			for (auto &bit : crossbits)
				json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
			write_json_bits("crossbits", true);
		}

		json_file << stringf("  },\n");

		Design *partdesign = new Design();

		Module *mod_gold = partdesign->addModule("\\gold." + partname.substr(1));
		Module *mod_gate = partdesign->addModule("\\gate." + partname.substr(1));

		std::vector<pair<int, IdString>> pi_layout, cp_layout, mp_layout, po_layout;

		auto copy_mod_contents = [&](bool in_gold, const SigSpec &pi, const SigSpec &cp,
				const SigSpec &mp, const SigSpec &po, const SigSig &conn)->void
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
			pio_bits.insert(cp.begin(), cp.end());
			pio_bits.insert(mp.begin(), mp.end());
			pio_bits.insert(po.begin(), po.end());

			pool<SigBit> unused_inputs;

			for (auto bit : pi) unused_inputs.insert(sigmap(bit));
			if (!in_gold)
				for (auto bit : cp) unused_inputs.insert(sigmap(bit));

			for (auto bit : po) unused_inputs.erase(sigmap(bit));
			if (in_gold)
				for (auto bit : cp) unused_inputs.erase(sigmap(bit));

			for (auto bit : gg_bits) {
				Wire *w = bit.wire;
				if (!w)
					continue;
				log_debug("  %s partition bit: %s\n", in_gold ? "gold" : "gate", log_signal(bit));
				if (!mapped_wires.count(w)) {
					Wire *ww = out_mod->addWire(w->name, GetSize(w));
					log_debug("  %s partition wire: %s\n", in_gold ? "gold" : "gate", log_id(w));
					// TBD: Copy some of the wire metadata
					mapped_wires[w] = ww;
				}
				if (pio_bits.count(bit))
					mapped_wires.at(w)->set_bool_attribute(ID::keep);
				else if (w->name.isPublic())
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
					if (c->input(conn.first))
						for (auto bit : conn.second)
							unused_inputs.erase(sigmap(bit));
					for (auto bit : sigmap(conn.second)) {
						SigBit out_bit;
						if (bit.wire == nullptr) {
							if (in_gold && bit == State::Sx)
								xbits_partition = true;
							out_bit = bit;
						} else if (c->output(conn.first) && (inbits.count(in_gold ? bit : worker->gate_matches.at(bit, bit)) ||
								(!in_gold && crossbits.count(worker->gate_matches.at(bit, bit)))))
							out_bit = out_mod->addWire(NEW_ID);
						else if (mapped_bits.count(bit))
							out_bit = mapped_bits.at(bit);
						else
							out_bit = out_mod->addWire(NEW_ID);
						s.append(out_bit);
						if (is_reg && conn.first == ID::Q && out_bit.is_wire()) {
							auto initval = initvals(bit);
							if (in_gold && initval == State::Sx)
								xbits_partition = true;
							out_initvals.set_init(out_bit, initval);
						}
					}
					log_debug("    port %s: %s => %s => %s\n", log_id(conn.first), log_signal(conn.second),
							log_signal(sigmap(conn.second)), log_signal(s));
					cc->setPort(conn.first, s);
				}
			}

			for (auto &bit : unused_inputs)
				json_bits[unescape_id(bit.wire->name)].insert(bit.offset);
			write_json_bits("unused");

			json_file << stringf("    \"cellcount\": %d,\n", GetSize(gg_cells));
			json_file << stringf("    \"bitcount\": %d\n", GetSize(gg_bits));
			json_file << stringf("  }%s\n", in_gold ? "," : "");

			SigSpec out_pi, out_po, out_cp, out_mp;
			for (auto bit : sigmap(pi))
				out_pi.append(bit.is_wire() ? mapped_bits.at(bit) : bit);
			for (auto bit : sigmap(cp))
				out_cp.append(bit.is_wire() ? mapped_bits.at(bit) : bit);
			for (auto bit : sigmap(mp))
				out_mp.append(bit.is_wire() ? mapped_bits.at(bit) : bit);
			for (auto bit : sigmap(po))
				out_po.append(bit.is_wire() ? mapped_bits.at(bit) : bit);

			int port_idx = 0;
			auto create_segments = [&](const std::vector<pair<int, IdString>> &layout, bool port_input, bool port_output) {
				SigSpec segments;
				for (auto element : layout) {
					Wire *w = out_mod->addWire(element.second, element.first);
					w->set_bool_attribute(ID::keep);
					w->port_input = port_input;
					w->port_output = port_output;
					if (port_input || port_output)
						w->port_id = ++port_idx;
					segments.append(w);
				}
				return segments;
			};

			if (GetSize(pi)) {
			#if 0
				Wire *piw = out_mod->addWire("\\__pi", GetSize(pi));
				piw->set_bool_attribute(ID::keep);
				piw->port_input = true;
				piw->port_id = ++port_idx;
				out_mod->connect(out_pi, piw);
			#else
				out_mod->connect(out_pi, create_segments(pi_layout, true, false));
			#endif
			}

			if (GetSize(cp)) {
			#if 0
				Wire *cpw = out_mod->addWire("\\__cp", GetSize(cp));
				cpw->set_bool_attribute(ID::keep);
				cpw->port_output = in_gold;
				cpw->port_input = !in_gold;
				cpw->port_id = ++port_idx;
				if (in_gold)
					out_mod->connect(cpw, out_cp);
				else
					out_mod->connect(out_cp, cpw);
			#else
				if (in_gold)
					out_mod->connect(create_segments(cp_layout, false, true), out_cp);
				else
					out_mod->connect(out_cp, create_segments(cp_layout, true, false));
			#endif
			}

			if (GetSize(mp)) {
			#if 0
				Wire *mpw = out_mod->addWire("\\__mp", GetSize(po));
				mpw->set_bool_attribute(ID::keep);
				pow->port_output = true;
				pow->port_id = ++port_idx;
				out_mod->connect(mpw, out_mp);
			#else
				out_mod->connect(create_segments(mp_layout, false, true), out_mp);
			#endif
			}

			if (GetSize(po)) {
			#if 0
				Wire *pow = out_mod->addWire("\\__po", GetSize(po));
				pow->set_bool_attribute(ID::keep);
				pow->port_output = true;
				pow->port_id = ++port_idx;
				out_mod->connect(pow, out_po);
			#else
				out_mod->connect(create_segments(po_layout, false, true), out_po);
			#endif
			}

			out_mod->fixup_ports();
		};

		SigSpec gold_pi, gold_cp, gold_mp, gold_po;
		SigSpec gate_pi, gate_cp, gate_mp, gate_po;
		SigSig gold_conn, gate_conn;

		{
			dict<SigBit, int> gate_pi_positions;
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
		}

		for (auto bit : crossbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			log("  partition cp bit %d: %s <-> %s\n", GetSize(gold_cp), log_signal(bit), log_signal(gate_bit));
			gold_cp.append(bit);
			gate_cp.append(gate_bit);
		}

		for (auto bit : gold_bits)
		{
			if (!worker->gold_matches.count(bit))
				continue;
			if (inbits.count(bit))
				continue;
			if (outbits.count(bit))
				continue;
			if (crossbits.count(bit))
				continue;
			auto gate_bit = worker->gold_matches.at(bit);
			if (!gate_bits.count(gate_bit))
				continue;
			log("  partition mp bit %d: %s <-> %s\n", GetSize(gold_mp), log_signal(bit), log_signal(gate_bit));
			gold_mp.append(bit);
			gate_mp.append(gate_bit);
		}

		for (auto bit : outbits)
		{
			auto gate_bit = worker->gold_matches.at(bit);
			log("  partition po bit %d: %s <-> %s\n", GetSize(gold_po), log_signal(bit), log_signal(gate_bit));
			gold_po.append(bit);
			gate_po.append(gate_bit);
		}

		auto sort_sig_pair =[&](SigSpec &sig1, SigSpec &sig2) {
			std::vector<pair<SigBit,SigBit>> bitpairs;
			for (int i = 0; i < GetSize(sig1); i++)
				bitpairs.emplace_back(sig1[i], sig2[i]);
			std::sort(bitpairs.begin(), bitpairs.end(), [&](const pair<SigBit,SigBit> &a, const pair<SigBit,SigBit> &b) {
				if (a.first.wire == nullptr || b.first.wire == nullptr) {
					if (a.first.wire != b.first.wire)
						return a.first.wire == nullptr;
					return a.first.data < b.first.data;
				}
				if (a.second.wire == nullptr || b.second.wire == nullptr) {
					if (a.second.wire != b.second.wire)
						return a.second.wire == nullptr;
					return a.second.data < b.second.data;
				}
				log_assert(a.first.wire && a.second.wire && b.first.wire && b.second.wire);
				if (a.first.wire != b.first.wire)
					return a.first.wire->name.str() < b.first.wire->name.str();
				if (a.second.wire != b.second.wire)
					return a.second.wire->name.str() < b.second.wire->name.str();
				if (a.first.offset != b.first.offset)
					return a.first.offset < b.first.offset;
				if (a.second.offset != b.second.offset)
					return a.second.offset < b.second.offset;
				return false;
			});
			sig1 = SigSpec();
			sig2 = SigSpec();
			for (int i = 0; i < GetSize(bitpairs); i++) {
				sig1.append(bitpairs[i].first);
				sig2.append(bitpairs[i].second);
			}
		};

		sort_sig_pair(gold_pi, gate_pi);
		sort_sig_pair(gold_cp, gate_cp);
		sort_sig_pair(gold_mp, gate_mp);
		sort_sig_pair(gold_po, gate_po);

		auto create_layout = [&](std::vector<pair<int, IdString>> &layout, const SigSpec &sig, const char *prefix) {
			for (auto chunk : sig.chunks()) {
				log_assert(chunk.wire);
				IdString name = chunk.width == chunk.wire->width ?
						stringf("%s%s", prefix, chunk.wire->name.c_str()+1) : chunk.width == 1 ?
						stringf("%s%s__%d", prefix, chunk.wire->name.c_str()+1, chunk.offset) :
						stringf("%s%s__%d_%d", prefix, chunk.wire->name.c_str()+1, chunk.offset+chunk.width-1, chunk.offset);
				layout.emplace_back(chunk.width, name);
			}
		};

		create_layout(pi_layout, gold_pi, "\\__pi_");
		create_layout(cp_layout, gold_cp, "\\__cp_");
		create_layout(mp_layout, gold_mp, "\\__mp_");
		create_layout(po_layout, gold_po, "\\__po_");

		copy_mod_contents(true, gold_pi, gold_cp, gold_mp, gold_po, gold_conn);
		copy_mod_contents(false, gate_pi, gate_cp, gate_mp, gate_po, gate_conn);

		json_file << stringf("}\n");

		if (!fragment) {
			std::ofstream vlog_file((filename_prefix + ".sv").c_str(), std::ofstream::trunc);

			vlog_file << "module miter (\n";

			std::vector<std::string> port_decls;
			for (auto it : pi_layout)
				port_decls.push_back(stringf("input  [%3d:0] %s", it.first-1, it.second.c_str()));
			port_decls.push_back("`ifdef DIRECT_CROSS_POINTS");
			for (auto it : cp_layout)
				port_decls.push_back(stringf("output [%3d:0] %s", it.first-1, it.second.c_str()));
			port_decls.push_back("`else");
			for (auto it : cp_layout)
				port_decls.push_back(stringf("output [%3d:0] %s__gold", it.first-1, it.second.c_str()));
			for (auto it : cp_layout)
				port_decls.push_back(stringf("input  [%3d:0] %s__gate", it.first-1, it.second.c_str()));
			port_decls.push_back("`endif");
			for (auto it : mp_layout)
				port_decls.push_back(stringf("output [%3d:0] %s__gold", it.first-1, it.second.c_str()));
			for (auto it : mp_layout)
				port_decls.push_back(stringf("output [%3d:0] %s__gate", it.first-1, it.second.c_str()));
			for (auto it : po_layout)
				port_decls.push_back(stringf("output [%3d:0] %s__gold", it.first-1, it.second.c_str()));
			for (auto it : po_layout)
				port_decls.push_back(stringf("output [%3d:0] %s__gate", it.first-1, it.second.c_str()));

			for (int i = 0; i < GetSize(port_decls); i++) {
				if (port_decls[i][0] == '`')
					vlog_file << port_decls[i] << "\n";
				else
					vlog_file << "  " << port_decls[i] << (i+1 < GetSize(port_decls) ? " ,\n" : "\n");
			}

			vlog_file << ");\n";

			for (auto gold : {true, false}) {
				vlog_file << "  " << (gold ? mod_gold : mod_gate)->name.str() << " " << (gold ? "gold" : "gate") << " (\n";
				port_decls.clear();
				for (auto it : pi_layout)
					port_decls.push_back(stringf(".%s (%s )", it.second.c_str(), it.second.c_str()));
				port_decls.push_back("`ifdef DIRECT_CROSS_POINTS");
				for (auto it : cp_layout)
					port_decls.push_back(stringf(".%s (%s )", it.second.c_str(), it.second.c_str()));
				port_decls.push_back("`else");
				for (auto it : cp_layout)
					port_decls.push_back(stringf(".%s (%s__%s )", it.second.c_str(), it.second.c_str(), (gold ? "gold" : "gate")));
				port_decls.push_back("`endif");
				for (auto it : mp_layout)
					port_decls.push_back(stringf(".%s (%s__%s )", it.second.c_str(), it.second.c_str(), (gold ? "gold" : "gate")));
				for (auto it : po_layout)
					port_decls.push_back(stringf(".%s (%s__%s )", it.second.c_str(), it.second.c_str(), (gold ? "gold" : "gate")));
				for (int i = 0; i < GetSize(port_decls); i++)
					if (port_decls[i][0] == '`')
						vlog_file << port_decls[i] << "\n";
					else
						vlog_file << "    " << port_decls[i] << (i+1 < GetSize(port_decls) ? ",\n" : "\n");
				vlog_file << "  );\n";
			}

			vlog_file << "`ifdef ASSUME_DEFINED_INPUTS\n";
			for (auto it : pi_layout)
				vlog_file << stringf("  miter_def_prop #(%d, \"assume\") %s__assume (%s );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifndef DIRECT_CROSS_POINTS\n";
			for (auto it : cp_layout)
				vlog_file << stringf("  miter_cmp_prop #(%d, \"assume\") %s__assume (%s__gold , %s__gate );\n",
						it.first, it.second.c_str(), it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef CHECK_MATCH_POINTS\n";
			for (auto it : mp_layout)
				vlog_file << stringf("  miter_cmp_prop #(%d, \"assert\") %s__assert (%s__gold , %s__gate );\n",
						it.first, it.second.c_str(), it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef CHECK_OUTPUTS\n";
			for (auto it : po_layout)
				vlog_file << stringf("  miter_cmp_prop #(%d, \"assert\") %s__assert (%s__gold , %s__gate );\n",
						it.first, it.second.c_str(), it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef COVER_DEF_CROSS_POINTS\n";
			vlog_file << "  `ifdef DIRECT_CROSS_POINTS\n";
			for (auto it : cp_layout)
				vlog_file << stringf("    miter_def_prop #(%d, \"cover\") %s__cover (%s );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "  `else\n";
			for (auto it : cp_layout)
				vlog_file << stringf("    miter_def_prop #(%d, \"cover\") %s__cover (%s__gold );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "  `endif\n";
			vlog_file << "`endif\n";

			vlog_file << "`ifdef COVER_DEF_GOLD_MATCH_POINTS\n";
			for (auto it : mp_layout)
				vlog_file << stringf("  miter_def_prop #(%d, \"cover\") %s__gold_cover (%s__gold );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef COVER_DEF_GATE_MATCH_POINTS\n";
			for (auto it : mp_layout)
				vlog_file << stringf("  miter_def_prop #(%d, \"cover\") %s__gate_cover (%s__gate );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef COVER_DEF_GOLD_OUTPUTS\n";
			for (auto it : po_layout)
				vlog_file << stringf("  miter_def_prop #(%d, \"cover\") %s__gold_cover (%s__gold );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "`ifdef COVER_DEF_GATE_OUTPUTS\n";
			for (auto it : po_layout)
				vlog_file << stringf("  miter_def_prop #(%d, \"cover\") %s__gate_cover (%s__gate );\n",
						it.first, it.second.c_str(), it.second.c_str());
			vlog_file << "`endif\n";

			vlog_file << "endmodule\n";
			vlog_file << "module miter_cmp_prop #(parameter WIDTH=1, parameter TYPE=\"assert\") (input [WIDTH-1:0] in_gold, in_gate);\n";
			vlog_file << "  reg okay;\n";
			vlog_file << "  integer i;\n";
			vlog_file << "  always @* begin\n";
			vlog_file << "    okay = 1;\n";
			vlog_file << "    for (i = 0; i < WIDTH; i = i+1)\n";
			vlog_file << "      okay = okay && (in_gold[i] === 1'bx || in_gold[i] === in_gate[i]);\n";
			vlog_file << "  end\n";
			vlog_file << "  generate\n";
			vlog_file << "    if (TYPE == \"assert\") always @* assert(okay);\n";
			vlog_file << "    if (TYPE == \"assume\") always @* assume(okay);\n";
			vlog_file << "    if (TYPE == \"cover\")  always @* cover(okay);\n";
			vlog_file << "  endgenerate\n";
			vlog_file << "endmodule\n";
			vlog_file << "module miter_def_prop #(parameter WIDTH=1, parameter TYPE=\"assert\") (input [WIDTH-1:0] in);\n";
			vlog_file << "  wire okay = ^in !== 1'bx;\n";
			vlog_file << "  generate\n";
			vlog_file << "    if (TYPE == \"assert\") always @* assert(okay);\n";
			vlog_file << "    if (TYPE == \"assume\") always @* assume(okay);\n";
			vlog_file << "    if (TYPE == \"cover\")  always @* cover(okay);\n";
			vlog_file << "  endgenerate\n";
			vlog_file << "endmodule\n";

			for (auto gold : {true, false}) {
				vlog_file << stringf("module %s (\n", (gold ? mod_gold : mod_gate)->name.c_str());
				port_decls.clear();
				for (auto it : pi_layout)
					port_decls.push_back(stringf("input  [%3d:0] %s", it.first-1, it.second.c_str()));
				for (auto it : cp_layout)
					port_decls.push_back(stringf("%s [%3d:0] %s", gold ? "output" : "input ", it.first-1, it.second.c_str()));
				for (auto it : mp_layout)
					port_decls.push_back(stringf("output [%3d:0] %s", it.first-1, it.second.c_str()));
				for (auto it : po_layout)
					port_decls.push_back(stringf("output [%3d:0] %s", it.first-1, it.second.c_str()));
				for (int i = 0; i < GetSize(port_decls); i++)
					vlog_file << "  " << port_decls[i] << (i+1 < GetSize(port_decls) ? " ,\n" : "\n");
				vlog_file << ");\n";
				vlog_file << "endmodule\n";
			}

			std::ofstream sby_file((filename_prefix + ".sby").c_str(), std::ofstream::trunc);
			sby_file << "[tasks]\n";
			sby_file << "check default\n";
			sby_file << "prove cover :\n";
			sby_file << "\n";
			sby_file << "[options]\n";
			sby_file << "depth 20\n";
			sby_file << "check: mode bmc\n";
			sby_file << "prove: mode prove\n";
			sby_file << "cover: mode cover\n";
			sby_file << "\n";
			sby_file << "[script]\n";
			sby_file << "verilog_defaults -add -D CHECK_OUTPUTS\n";
			sby_file << "verilog_defaults -add -D CHECK_MATCH_POINTS\n";
			sby_file << "verilog_defaults -add -D COVER_DEF_CROSS_POINTS\n";
			sby_file << "verilog_defaults -add -D COVER_DEF_GOLD_MATCH_POINTS\n";
			sby_file << "verilog_defaults -add -D COVER_DEF_GATE_MATCH_POINTS\n";
			sby_file << "verilog_defaults -add -D COVER_DEF_GOLD_OUTPUTS\n";
			sby_file << "verilog_defaults -add -D COVER_DEF_GATE_OUTPUTS\n";
			if (xbits_partition)
				sby_file << "# ";
			sby_file << "verilog_defaults -add -D DIRECT_CROSS_POINTS\n";
			sby_file << "# verilog_defaults -add -D ASSUME_DEFINED_INPUTS\n";
			sby_file << "read_verilog -sv ../../" << partname.substr(1) << ".sv\n";
			sby_file << "read_ilang ../../" << partname.substr(1) << ".il\n";
			sby_file << "hierarchy -top miter; proc\n";
			sby_file << "formalff -clk2ff -ff2anyinit gate." << partname.substr(1) << "\n";
			sby_file << "setundef -anyseq gate." << partname.substr(1) << "\n";
			sby_file << "flatten -wb; dffunmap; opt_expr -keepdc -undriven; opt_clean\n";
			if (!xbits_partition)
				sby_file << "# ";
			sby_file << "xprop -formal -split-ports -assume-def-inputs miter\n";
			sby_file << "\n";
			sby_file << "[engines]\n";
			sby_file << "prove: abc pdr\n";
			sby_file << "smtbmc --keep-going bitwuzla\n";
		}

		return partdesign;
	}
};

void EqyPartitionWorker::check_integrity()
{
	log_debug("CHECKING DATABASE INTEGRITY\n");

	dict<SigBit, int> new_po_fragment_index;
	dict<SigBit, int> new_po_partition_index;
	dict<SigBit, pool<int>> new_pi_fragments_index;
	dict<SigBit, pool<int>> new_pi_partitions_index;

	for (int idx = 0; idx < GetSize(partitions); idx++) {
		auto p = partition(idx);

		if (p->fragment && (p->merged_into == -1 || !partition(p->merged_into)->fragment)) {
			for (auto bit : p->outbits) {
				log_assert(!new_po_fragment_index.count(bit));
				new_po_fragment_index[bit] = p->index;
			}
			for (auto bit : p->inbits)
				new_pi_fragments_index[bit].insert(p->index);
		}

		if (!p->superseded) {
			for (auto bit : p->outbits) {
				log_assert(!new_po_partition_index.count(bit));
				new_po_partition_index[bit] = p->index;
			}
			for (auto bit : p->inbits)
				new_pi_partitions_index[bit].insert(p->index);
		}
	}

#if 0
	po_fragment_index.sort();
	new_po_fragment_index.sort();
	log_dump(po_fragments_index);
	log_dump(new_po_fragments_index);
#endif
	log_assert(new_po_fragment_index == po_fragment_index);

#if 0
	po_partition_index.sort();
	new_po_partition_index.sort();
	log_dump(po_partition_index);
	log_dump(new_po_partition_index);
#endif
	log_assert(new_po_partition_index == po_partition_index);

#if 0
	pi_fragments_index.sort();
	new_pi_fragments_index.sort();
	for (auto &it : pi_fragments_index) it.second.sort();
	for (auto &it : new_pi_fragments_index) it.second.sort();
	log_dump(pi_fragments_index);
	log_dump(new_pi_fragments_index);
#endif
	log_assert(new_pi_fragments_index == pi_fragments_index);

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

Partition *EqyPartitionWorker::create_full_partition()
{
	log_assert(queue.empty());
	auto *full_partition = create_partition();
	full_partition->full_part = true;
	for (auto w : gold->wires()) {
		for (auto bit : gold_sigmap(w))
			if (gold_matches.count(bit))
				queue.insert(bit);
	}
	while (!queue.empty())
		full_partition->add(*queue.begin());
	return full_partition;
}

void EqyPartitionWorker::create_partitions()
{
	while (!queue.empty()) {
		SigBit gold_bit = *queue.begin();
		Partition *partition = create_partition();
		partition->fragment = true;
		partition->add(gold_bit);
	}

	log_spacer();
	log("Final list of fragment partitions:\n");
	for (int i = 0; i < GetSize(partitions); i++) {
		auto p = partition(i);
		if (p->superseded)
			continue;
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
				log_assert(!p->superseded);
				log("  PO bit %s belongs to partition %d\n", log_signal(bit), p->index);
				if (p->marked_final) {
					log("    Skipping partition marked final.\n");
					continue;
				}
				for (auto &n : p->names)
					if (rule[2] == n) {
						log("    Partition already has this name.\n");
						goto next_name_bit;
					}
				if (name_database.count(rule[2])) {
					auto target = partition(name_database.at(rule[2]))->make_get_nonfragment();
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
			next_name_bit:;
			}
			continue;
		}

		if (rule[0] == "merge" && GetSize(rule) >= 3) {
			Partition *first = nullptr;
			for (int i = 1; i < GetSize(rule); i++) {
				for (auto bit : gold_sigmap(gold->wire("\\" + rule[i]))) {
					if (!po_partition_index.count(bit))
						continue;
					auto p = partition(po_partition_index.at(bit));
					log_assert(!p->superseded);
					log("  PO bit %s belongs to partition %d\n", log_signal(bit), p->index);
					if (p->marked_final) {
						log("    Skipping partition marked final.\n");
						continue;
					}
					if (first == nullptr) {
						first = p->make_get_nonfragment();
						log("    Using partition %d as merge target.\n", first->index);
					} else if (first != p) {
						log("    Merging partition %d into partition %d.\n", p->index, first->index);
						first->merge(p);
					}
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
				auto generator = partition(po_partition_index.at(bit))->make_get_nonfragment();
				log_assert(!generator->superseded);
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

		if (rule[0] == "amend" && GetSize(rule) == 3) {
			pool<int> generators, consumers;
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_fragment_index.count(bit) && !noamend_database.count(bit)) {
					log("  PO bit %s matches no fragment partition\n", log_signal(bit));
					continue;
				}
				auto generator = partition(po_fragment_index.at(bit));
				log_assert(generator->fragment);
				log("  PO bit %s belongs to fragment partition %d\n", log_signal(bit), generator->index);
				generators.insert(generator->index);
			}
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[2]))) {
				if (!po_partition_index.count(bit)) {
					log("  match bit %s matches no partition\n", log_signal(bit));
					continue;
				}
				auto consumer = partition(po_partition_index.at(bit));
				auto p = consumer->make_get_nonfragment();
				log("  match bit %s belongs to partition %d (%d)\n", log_signal(bit), p->index, consumer->index);
				consumers.insert(p->index);
			}
			for (auto i : consumers) {
				auto p = partition(i);
				for (auto j : generators) {
					if (!p->amend_with.count(j)) {
						log("    Queue amending partition %d with partition %d.\n", i, j);
						p->amend_with.insert(j);
					} else {
						log("    Amending partition %d with partition %d is already queued.\n", i, j);
					}
				}
			}
			continue;
		}

		if (rule[0] == "amend" && GetSize(rule) == 2) {
			for (auto bit : gold_sigmap(gold->wire("\\" + rule[1]))) {
				if (!po_partition_index.count(bit) && !noamend_database.count(bit))
					continue;
				amend_database.insert(bit);
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
				log_assert(!p->superseded);
				p->marked_final = true;
			}
			continue;
		}

		message = "Malformed partition rule:";
		for (auto &word : rule)
			message += " " + word;
		log_error("%s\n", message.c_str());
	}

	auto exec_amend = [&]() -> bool {
		log("Execute queued amend rules.\n");
		bool did_something = false;
		for (int idx = 0; idx < GetSize(partitions); idx++) {
			auto p = partition(idx);
			if (p->superseded || p->amend_with.empty())
				continue;

			pool<int> this_amend_with, next_amend_with;
			for  (auto q : p->amend_with) {
				if (p->info_merged_flat.count(q)) {
					log("  partition %d is already merged into partition %d\n", q, idx);
					continue;
				}
				if (p->info_amended.count(q)) {
					log("  partition %d is already amended to partition %d\n", q, idx);
					continue;
				}
				auto generator = partition(q);
				for (auto bit : generator->outbits)
					if (p->inbits.count(bit)) {
						log("  found PI/PO link from partition %d to partition %d: %s\n", q, idx, log_signal(bit));
						this_amend_with.insert(q);
						goto found_bit_match;
					}
				log("  no PI/PO link from partition %d to partition %d: re-queue\n", q, idx);
				next_amend_with.insert(q);
			found_bit_match:;
			}

			if (this_amend_with.empty()) {
				p->amend_with = next_amend_with;
			} else {
				auto pp = p->make_get_nonfragment();
				if (p->index != pp->index) {
					log("  created non-fragment clone of partition %d as partition %d.\n", p->index, pp->index);
				} else {
					for (auto q : this_amend_with) {
						log("  amending partition %d with partition %d.\n", p->index, q);
						p->import(partition(q));
						did_something = true;
					}
					p->amend_with = next_amend_with;
				}
			}
		}
		return did_something;
	};

	auto find_amend = [&]() -> bool {
		log("Find automatic amend rules.\n");
		bool did_something = false;
		for (int idx = 0; idx < GetSize(partitions); idx++) {
			auto p = partition(idx);
			if (p->superseded) continue;

			log("  Checking partition %d:\n", p->index);

			pool<int> po_matches, pi_matches;
			for (auto bit : p->inbits) {
				if (!amend_database.count(bit) && noamend_database.count(bit))
					continue;

				if (po_fragment_index.count(bit)) {
					int pidx = po_fragment_index.at(bit);
					if (p->index != pidx && !p->info_amended.count(pidx) && !p->info_merged_flat.count(pidx)) {
						if (amend_database.count(bit)) {
							if (!pi_matches.count(pidx))
								log("    partition %d is an automatic PO match: %s\n", pidx, log_signal(bit));
							po_matches.insert(pidx);
							pi_matches.insert(pidx);
						} else {
							if (!po_matches.count(pidx))
								log_debug("    partition %d is a PO match: %s\n", pidx, log_signal(bit));
							po_matches.insert(pidx);
						}
					}
				}
			}

#if 0
			for (auto bit : p->inbits) {
				if (noamend_database.count(bit) || !pi_fragments_index.count(bit))
					continue;

				for (auto pidx : pi_fragments_index.at(bit)) {
					if (!po_matches.count(pidx) || pi_matches.count(pidx)) continue;
					log("    partition %d is also a PI match: %s\n", pidx, log_signal(bit));
					pi_matches.insert(pidx);
				}
			}
#endif

			log("    Found %d po matches and %d auto/pi matches.\n", GetSize(po_matches), GetSize(pi_matches));

			for (auto pidx : pi_matches) {
				log_assert(po_matches.count(pidx));

				pool<SigBit> matched_pis, matched_pos;
				auto frag = partition(pidx);

				for (auto bit : frag->inbits)
					if (p->inbits.count(bit))
						matched_pis.insert(bit);

				for (auto bit : frag->outbits)
					if (p->inbits.count(bit))
						matched_pos.insert(bit);
				log_assert(frag->crossbits.empty());

				log("    Queue amending partition %d with partition %d (%d pi matches and %d po matches).\n",
						p->index, frag->index, GetSize(matched_pis), GetSize(matched_pos));
				did_something = true;
				p->amend_with.insert(frag->index);

				for (auto bit : matched_pis)
					log("      PI: %s\n", log_signal(bit));
				for (auto bit : matched_pos)
					log("      PO: %s\n", log_signal(bit));

				// log_assert(!matched_pis.empty());
				log_assert(!matched_pos.empty());
			}
		}
		return did_something;
	};

	log_spacer();
	log("Amending partitions:\n");
	while (exec_amend()) {}
	while (find_amend() && exec_amend()) {
		while (exec_amend()) {}
	}

	log_spacer();
	log("Assigning partition names:\n");
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
		if (partition->superseded)
			continue;

		if (partition->name_priority) {
			log("Partition %d already has a name: %s\n", partition->index, partition->names.front().c_str());
			continue;
		}

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
				if (c == '[') r += '.';
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
		for (int extra_idx = 0; !partition->name_priority; ++extra_idx) {
			for (auto &it : candidates) {
				std::string name = std::get<1>(it);
				if (extra_idx)
					name += stringf("_%d", extra_idx);
				if (name_database.count(name)) {
					log_debug("  name '%s' is already taken\n", name.c_str());
					continue;
				}

				log("Automatically naming partition %d '%s' using a PO name: %s\n", partition->index, name.c_str(), std::get<2>(it).c_str());
				partition->name_priority = ++name_priority;
				name_database[std::get<1>(it)] = partition->index;
				partition->names.push_back(std::get<1>(it));
				break;
			}
		}
	}

	log_spacer();
	log("Partition Summary:\n");
	log("  Fragments:\n");
	for (auto &p_ptr : partitions) {
		auto p = p_ptr.get();
		if (!p->active_fragment())
			continue;
		std::string label;
		SigSpec hidden_outbits;
		SigSpec sorted_outbits = p->outbits;
		sorted_outbits.sort_and_unify();
		while (!sorted_outbits.empty()) {
			SigChunk best_chunk;
			std::string best_label;
			for (auto chunk : sorted_outbits.chunks()) {
				if (GetSize(best_chunk) != GetSize(chunk)) {
					if (GetSize(best_chunk) < GetSize(chunk))
						best_chunk = chunk, best_label = log_signal(chunk);
					continue;
				}
				std::string this_label = log_signal(chunk);
				if (GetSize(best_label) != GetSize(this_label)) {
					if (GetSize(best_label) > GetSize(this_label))
						best_chunk = chunk, best_label = this_label;
					continue;
				}
				if (best_label > this_label)
					best_chunk = chunk, best_label = this_label;
			}
			if (label.empty()) {
				label = log_signal(best_chunk);
			} else {
				std::string new_label = label + ", " + log_signal(best_chunk);
				if (GetSize(new_label) < 150)
					label = new_label;
				else
					hidden_outbits.append(best_chunk);
			}
			sorted_outbits.remove(best_chunk);
		}
		if (!hidden_outbits.empty())
			label += stringf(", and %d more bits", GetSize(hidden_outbits));
		log("     %3d: %s\n", p->index, label.c_str());
	}
	log("  Partitions:\n");
	for (auto &p_ptr : partitions) {
		auto p = p_ptr.get();
		if (p->superseded)
			continue;
		log("     %3d: %s\n", p->index, p->names.front().c_str());
	}
	log("  Fragment-Partition-Matrix:\n");
	log("          ");
	for (auto &q_ptr : partitions) {
		auto q = q_ptr.get();
		if (!q->fragment)
			continue;
		if (q->index % 10 == 0)
			log(" %-11d", q->index / 10);
	}
	log("\n");
	log("          ");
	for (auto &q_ptr : partitions) {
		auto q = q_ptr.get();
		if (!q->fragment)
			continue;
		if (q->index % 5 == 0)
			log(" ");
		log("%d", q->index % 10);
	}
	log("\n");
	for (auto &p_ptr : partitions) {
		auto p = p_ptr.get();
		if (p->superseded)
			continue;
		log("     %3d  ", p->index);
		for (auto &q_ptr : partitions) {
			auto q = q_ptr.get();
			if (!q->fragment)
				continue;
			if (q->index % 5 == 0)
				log(" ");
			if (!q->active_fragment())  {
				log(",");
				continue;
			}
			if (p == q) {
				log("#");
				continue;
			}
			if (p->info_merged_flat.count(q->index)) {
				log("*");
				continue;
			}
			if (p->info_amended.count(q->index)) {
				log("+");
				continue;
			}
			bool is_fragment_driver = false;
			bool is_driver = false;
			for (auto bit : q->outbits) {
				if (p->inbits.count(bit)) {
					if (p->amended_bits.count(bit))
						is_fragment_driver = true;
					else
						is_driver = true;
					break;
				}
			}
			if (is_driver) {
				log("=");
				continue;
			}
			if (is_fragment_driver) {
				log("-");
				continue;
			}
			log(".");
		}
		log("  %s\n", p->names.front().c_str());
	}
	log("  Legend for Fragment-Partition-Matrix:\n");
	log("      #  .... partition is this single fragment\n");
	log("      *  .... fragments merged into single partition\n");
	log("      +  .... fragments amended to the partition\n");
	log("      =  .... fragment is driving a partition input\n");
	log("      -  .... fragment is driving an amended fragment\n");
	log("      .  .... no relationship between fragment and partition\n");
	log("      ,  .... unused fragment index (as result of grouping)\n");
}

void EqyPartitionWorker::write(bool fragments)
{
	std::ofstream list_file = std::ofstream(fragments ? "fragment.list" : "partition.list", std::ofstream::out);

	for (auto &it : partitions)
	{
		Partition *partition = it.get();
		if (fragments) {
			if (!partition->fragment)
				continue;
		} else {
			if (partition->superseded)
				continue;
		}

		std::string partname = partition->full_part ? gold->name.substr(6) : partition->name_priority ?
				stringf("%s.%s", gold->name.substr(6).c_str(), partition->names.front().c_str()) :
				stringf("%s.%d", gold->name.substr(6).c_str(), partition->index);
		std::string filename_prefix = stringf("%s/%s",
				partition->full_part ? "modules" : fragments ? "fragments" : "partitions", partname.c_str());

		bool xbits_partition;
		IdString partid = "\\" + partname;
		Design *partdesign = partition->write(partid, filename_prefix, xbits_partition, fragments);

		pool<SigBit> unused_gold_inputs = partition->inbits;
		for (auto cell : partition->gold_cells)
			for (auto conn : cell->connections())
				for (auto bit : gold_sigmap(conn.second))
					if (unused_gold_inputs.count(bit))
						unused_gold_inputs.erase(bit);

		if (!partition->full_part)
		{
			list_file << unescape_id(gold->name).substr(5) << " ";
			list_file << partname;

			bool has_memory = false;
			for (auto module : partdesign->modules()) {
				if (!has_memory)
					has_memory = !Mem::get_all_memories(module).empty();
			}

			if (has_memory)
				list_file << " memory";

			if (xbits_partition)
				list_file << " xbits";

			list_file << " :";
			SigSpec outsig(partition->outbits);
			outsig.sort();

			for (auto chunk : outsig.chunks())
				if (chunk.offset == 0 && chunk.width == chunk.wire->width != 1)
					list_file << stringf(" %s", unescape_id(chunk.wire->name).c_str());
				else if (chunk.width == 1)
					list_file << stringf(" %s[%d]", unescape_id(chunk.wire->name).c_str(), chunk.offset);
				else
					list_file << stringf(" %s[%d:%d]", unescape_id(chunk.wire->name).c_str(), chunk.offset+chunk.width-1, chunk.offset);

			list_file << "\n";
		}

		Backend::backend_call(partdesign, nullptr, filename_prefix + ".il", "rtlil");
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

	void partition_worker(Design *design, bool write_fragments,
			const dict<std::string, std::vector<std::pair<std::string, std::string>>> &matched_ids,
			const dict<std::string, std::vector<std::vector<std::string>>> &partiton_ids)
	{
		int num_gold_modules = 0;
		for (auto gold : design->modules())
		{
			if (gold->name.begins_with("\\gold."))
			{
				num_gold_modules++;
				Module *gate = design->module("\\gate." + gold->name.substr(6));
				if (!gate)
					log_error("Could not find matching gate for module %s\n", log_id(gold));
				log_header(design, "Processing module pair %s / %s.\n", log_id(gold), log_id(gate));
				log_push();

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

				log_header(design, "Create fragment partitions for module %s.\n", gold->name.substr(6).c_str());
				worker.create_partitions();
				worker.check_integrity();

				log_header(design, "Execute partitioning commands for module %s.\n", gold->name.substr(6).c_str());
				worker.merge_partitions();
				//worker.check_integrity();

				if (write_fragments) {
					log_header(design, "Write fragments for module %s.\n", gold->name.substr(6).c_str());
					worker.write(true);
				}

				log_header(design, "Write partitions for module %s.\n", gold->name.substr(6).c_str());
				worker.create_full_partition();
				worker.write(false);
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
			if ((things[0] == "name" || things[0] == "path" || things[0] == "amend") && GetSize(things) == 4) {
				partition_ids[things[1]].push_back({things[0], things[2], things[3]});
				continue;
			}
			if ((things[0] == "bind" || things[0] == "sticky" || things[0] == "solo" || things[0] == "final" ||
					things[0] == "amend" || things[0] == "noamend") && GetSize(things) == 3) {
				partition_ids[things[1]].push_back({things[0], things[2]});
				continue;
			}
			if ((things[0] == "group" || things[0] == "merge") && GetSize(things) >= 3) {
				auto modname = things[1];
				things.erase(things.begin()+1);
				partition_ids[modname].push_back(things);
				continue;
			}
			log_error("Malformed line %d in file %s\n", linenr, filename.c_str());
		}
		return partition_ids;
	}

	void execute(std::vector<std::string> args, Design *design) override
	{
		std::string matched_ids_filename, partition_ids_filename;
		bool write_fragments = false;

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
			if (args[argidx] == "-write_fragments") {
				write_fragments = true;
				continue;
			}
			break;
		}
		extra_args(args, argidx, design, false);

		log_header(design, "Executing EQY PARTITION task.\n");

		if (matched_ids_filename.empty() || partition_ids_filename.empty())
			log_error("Both matched ids and partition ids parameters are required.\n");

		auto matched_ids = read_matched_ids(matched_ids_filename);
		dict<std::string, std::vector<std::vector<std::string>>> partition_ids = read_partition_ids(partition_ids_filename);

		log_push();
		partition_worker(design, write_fragments, matched_ids, partition_ids);
		log_pop();
	}
} EqyPartitionPass;

PRIVATE_NAMESPACE_END
