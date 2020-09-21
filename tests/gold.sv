module submod (
	input [1:0] i1,
	input [1:0] i2,
	output [1:0] o
	);

	assign o = i1 ^ i2;

endmodule

module top (
	input i1,
	input i2a,
	input i2b,
	input i2c,
	output o
);

	wire i2ab = i2a ? i2b : 1'b0;

	submod m_i (
		.i1(~|{!i2ab, !i2c}),
		.i2(i1),
		.o(o)
	);

endmodule
