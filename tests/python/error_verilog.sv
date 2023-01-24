module counter(input clk, rst, en, output reg state [7:0]);
	always @(posedge clk)
		state <= rst ? 0 : state + en;
endmodule
