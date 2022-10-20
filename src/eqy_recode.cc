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

		if (saved_designs.find("gold") == saved_designs.end())
			log_error("Design \"gold\" not found in saved designs.");
		if (saved_designs.find("gate") == saved_designs.end())
			log_error("Design \"gate\" not found in saved designs.");
		Design *gold_design = saved_designs.at("gold");
		Design *gate_design = saved_designs.at("gate");

		IdString gold_top = gold_design->top_module()->name;
		IdString gate_top = gate_design->top_module()->name;
		if (gold_top != gate_top)
			log_error("Top modules of gold and gate do not have the same name.\n");

		log_header(design, "Executing EQY RECODE task.\n");

        auto recode_data = read_recode_data(recode_filename);
	}
} EqyRecodePass;

PRIVATE_NAMESPACE_END
