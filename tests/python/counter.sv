module counter(input clk, rst, en, output reg [7:0] state);
	always @(posedge clk)
		state <= rst ? 0 : state + en;
endmodule
