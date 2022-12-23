// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

`timescale 1 ns / 1 ps

module testbench;
	reg clk = 1;
	reg resetn = 0;
	reg okay = 0;
	wire trap;

	always #5 clk = ~clk;

	initial begin
`ifdef GOLD
		$dumpfile("test_gold.vcd");
		$dumpvars(0, testbench);
`else
		$dumpfile("test_gate.vcd");
		$dumpvars(0, testbench);
`endif
		repeat (5) @(posedge clk);
		resetn <= 1;
		repeat (120000) @(posedge clk);
		$stop;
	end

	wire mem_valid;
	wire mem_instr;
	reg mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	reg  [31:0] mem_rdata;

	picorv32 uut (
		.clk         (clk        ),
		.resetn      (resetn     ),
		.trap        (trap       ),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  )
	);

	reg [10:0] hickup_state = 0;
	wire hickup = !hickup_state[10:8] && (hickup_state[7] != (hickup_state[6:0] < 7 || (hickup_state[6:0] % 7 == 0) || (hickup_state[6:0] % 5 == 0)));
	always @(posedge clk) hickup_state <= hickup_state + 1;

	reg [31:0] memory [0:128*1024/4-1];
	initial $readmemh("firmware.hex", memory);

	always @* begin
		mem_ready = 0;
		mem_rdata = 0;
		if (resetn && mem_valid) begin
			if (mem_addr < 128*1024) begin
				mem_ready = !hickup;
				mem_rdata = memory[mem_addr >> 2];
			end
			if (mem_addr == 32'h1000_0000 || mem_addr == 32'h2000_0000) begin
				mem_ready = !hickup;
			end
		end
	end

	always @(posedge clk) begin
		if (resetn && mem_valid && mem_ready && mem_wstrb) begin
			if (mem_addr < 128*1024) begin
				if (mem_wstrb[0]) memory[mem_addr >> 2][ 7: 0] <= mem_wdata[ 7: 0];
				if (mem_wstrb[1]) memory[mem_addr >> 2][15: 8] <= mem_wdata[15: 8];
				if (mem_wstrb[2]) memory[mem_addr >> 2][23:16] <= mem_wdata[23:16];
				if (mem_wstrb[3]) memory[mem_addr >> 2][31:24] <= mem_wdata[31:24];
			end
			if (mem_addr == 32'h1000_0000) begin
				$write("%c", mem_wdata);
				$fflush();
			end
			if (mem_addr == 32'h2000_0000) begin
				okay <= 1;
			end
		end
		if (resetn && trap) begin
			if (okay) $finish; else $stop;
		end
	end
endmodule
