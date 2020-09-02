module submod (
	input [1:0] i1,
	input [1:0] i2,
	output [1:0] o
	);

	assign o = i1 ^ i2;

endmodule

module top (
	input i1,
	input i2,
	output o
	);

	submod m_i (
		.i1(i2),
		.i2(i1),
		.o(o)
	);

endmodule
