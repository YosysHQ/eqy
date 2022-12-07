/*
Equivalence Checking with Yosys (eqy)

Copyright (C) 2022 Miodrag Milanovic <micko@yosyshq.com>

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

struct EqyRecodePass : public Pass
{
	EqyRecodePass() : Pass("eqy_recode", "recode gate design FSM for eqy") { }

	dict<std::string, dict<std::string, std::vector<std::pair<std::string, std::string>>>> read_recode_data(std::string filename)
	{
		dict<std::string, dict<std::string, std::vector<std::pair<std::string, std::string>>>> matched_ids;
		std::ifstream matched_file(filename.c_str());
		if (!matched_file)
			log_error("Cannot open file '%s'\n", filename.c_str());
		std::string line;
		for (int linenr = 1; std::getline(matched_file, line); linenr++) {
			std::vector<std::string> things = split_tokens(line);
			if (things.size() != 4)
				log_error("Malformed line %d in file %s\n", linenr, filename.c_str());
			matched_ids[things[0]][things[1]].push_back(std::make_pair(things[2], things[3]));
		}
		return matched_ids;
	}

	void help() override
	{
		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    eqy_recode -recode file\n");
		log("\n");
		log("Update gate design and add logic for recoding specified states.\n");
		log("For use by EQY.\n");
		log("\n");
		log("    -recode <filename>\n");
		log("        Recode data mapping per module entity values.\n");
		log("\n");
	}

	void execute(std::vector<std::string> args, Design *design) override
	{
		std::string recode_filename;

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++)
		{
			if ((args[argidx] == "-recode") && argidx+1 < args.size()) {
				recode_filename = args[++argidx];
				continue;
			}
			break;
		}

		extra_args(args, argidx, design, false);

		log_header(design, "Executing EQY RECODE task.\n");

		if (saved_designs.find("gold") == saved_designs.end())
			log_error("Design \"gold\" not found in saved designs.");

		Design *gold_design = saved_designs.at("gold");

		IdString gold_top = gold_design->top_module()->name;
		IdString gate_top = design->top_module()->name;
		if (gold_top != gate_top)
			log_error("Top modules of gold and gate do not have the same name.\n");

		auto recode_data = read_recode_data(recode_filename);

		if (recode_data.empty()) return;

		for (auto mod : recode_data) {
			IdString module_name = RTLIL::escape_id(mod.first);
			Module *gate_m = design->module(module_name);
			if (!gate_m)
				log_error("Module '%s' not found in gate.\n", mod.first.c_str());
			Module *gold_m = gold_design->module(module_name);
			if (!gold_m)
				log_error("Module '%s' not found in gold.\n", mod.first.c_str());
			for (auto entity : mod.second) {
				IdString name = RTLIL::escape_id(entity.first);
				IdString new_name = RTLIL::escape_id("__original__" + entity.first);
				Wire *gate_w = gate_m->wire(name);
				if (!gate_w)
					log_error("Wire '%s' not found in gate.\n", entity.first.c_str());
				Wire *gold_w = gold_m->wire(name);
				if (!gold_w)
					log_error("Wire '%s' not found in gold.\n", entity.first.c_str());
				gate_m->rename(gate_w, new_name);
				gate_w = gate_m->wire(new_name);
				Wire *new_wire = gate_m->addWire(name, gold_w->width);
				new_wire->start_offset = gold_w->start_offset;
				new_wire->upto = gold_w->upto;

				SigSpec sig;
				std::string other_val;
				size_t gate_size = gate_w->width;
				size_t gold_size = gold_w->width;
				for (auto map : entity.second) {
					if (gate_size != map.second.size())
						log_error("Mapping gate value '%s' not proper width.\n", map.second.c_str());
					if (gold_size != map.first.size())
						log_error("Mapping gold value '%s' not proper width.\n", map.first.c_str());
					RTLIL::Wire *y_wire = gate_m->addWire(NEW_ID);
					gate_m->addEq(NEW_ID, gate_w, Const::from_string(map.second), y_wire);
					other_val += map.first;
					sig.append(y_wire);
				}
				sig.reverse();
				gate_m->addPmux(NEW_ID, RTLIL::Const(State::Sx, gold_size), Const::from_string(other_val), sig, new_wire);
			}
		}
	}
} EqyRecodePass;

PRIVATE_NAMESPACE_END
