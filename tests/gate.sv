module test (
	input i1,
	input i2,
	output o
	);

	assign o = i1 ? ~i2 : i2;

endmodule
