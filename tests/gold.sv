module submod (
	input i1,
	input i2,
	output o
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
