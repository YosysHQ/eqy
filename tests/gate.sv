module submod (
	input i1,
	input i2,
	output o
);

	myxor m_i (
		.i1(i2),
		.i2(i1),
		.o(o)
	);

endmodule

module myxor (
	input i1,
	input i2,
	output o
);

	assign o = i1 ? ~i2 : i2;

endmodule

module top (
	input i1,
	input i2a,
	input i2b,
	input i2c,
	output o
);
	wire i2ba = i2a && i2b;

	submod m_i (
		.i1(i2ba && i2c),
		.i2(i1),
		.o(o)
	);

endmodule
