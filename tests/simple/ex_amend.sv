`ifdef GOLD
module top(input A, B, C, output [1:0] X, Y);
	assign X = 1 << (A^B);
	assign Y = X ^ {2{C}};
endmodule
`endif

`ifdef GATE
module top(input A, B, C, output [1:0] X, Y);
	assign X = {A^B, !(A^B)};
	assign Y = 2'b 01 ^ {2{C^X[1]}};
endmodule
`endif
