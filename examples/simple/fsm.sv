module top (
	input clk,
	output reg [1:0] o
	);

`ifdef GOLD
	(*keep *) reg [3:0] currentstate = 4'b0001;
	always @ (posedge clk)
	begin
		case (currentstate)
			4'b0001 : begin
				o <= 2'b01;
				currentstate <= 4'b0010;
			end
			4'b0010 :  begin
				o <= 2'b10;
				currentstate <= 4'b0100;
			end
			4'b0100:  begin
				o <= 2'b11;
				currentstate <= 4'b1000;
			end
			default :  begin
				o <= 2'b00;
				currentstate <= 4'b0001;
			end
		endcase
	end
`endif

`ifdef GATE
	(*keep *) reg [3:0] currentstate = 4'b1110;
	always @ (posedge clk)
	begin
		case (currentstate)
			4'b1110 : begin
				o <= 2'b01;
				currentstate <= 4'b1101;
			end
			4'b1101 :  begin
				o <= 2'b10;
				currentstate <= 4'b1011;
			end
			4'b1011:  begin
				o <= 2'b11;
				currentstate <= 4'b0111;
			end
			default :  begin
				o <= 2'b00;
				currentstate <= 4'b1110;
			end
		endcase
	end
`endif
endmodule

