`ifdef GOLD
module aliases(input [7:0] A, output [7:0] X, Y, Z);
	assign X = A && !A ? 0 : A;
	assign Y = X;
	assign Z = A && !A ? 23 : 42;
endmodule
`endif
`ifdef GATE
module aliases(input [7:0] A, output [7:0] X, Y, Z);
	assign X = A;
	assign Y = A;
	assign Z = 42;
endmodule
`endif
