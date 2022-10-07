module top(input a, b, c, d, output [2:0] X, Y, Z);
	assign X = $signed(a) + $signed(b);
	assign Y = c + d;
	assign Z = X + Y;
endmodule
