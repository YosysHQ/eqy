module multiplier(input clk, input [3:0] a, input [3:0] b, output reg [3:0] y);
	always @(posedge clk)
		y <= a * b;
endmodule

module pipeline(input clk, input [3:0] a, input [3:0] b, input [3:0] c, output [3:0] y);
	wire [3:0] ab;
	reg [3:0] c_q;

	always @(posedge clk)
		c_q <= c;

	multiplier mult_1(.clk(clk), .a(a), .b(b), .y(ab));
	multiplier mult_2(.clk(clk), .a(ab), .b(c_q), .y(y));
endmodule

module top(input clk, input reset, output [3:0] y);
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] c;

	always @(posedge clk) begin
		if (reset) begin
			a <= 0;
			b <= 0;
			c <= 0;
		end else begin
			a <= a + 1;
			b <= b + 1;
			c <= c + y;
		end
	end

	pipeline pipeline(clk, a, b, c, y);
endmodule
