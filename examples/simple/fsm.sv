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
	(*keep *) reg [1:0] currentstate = 2'b00;
	always @ (posedge clk)
	begin
		case (currentstate)
			2'b00 : begin
				o <= 2'b01;
				currentstate <= 2'b01;
			end
			2'b01 :  begin
				o <= 2'b10;
				currentstate <= 2'b10;
			end
			2'b10:  begin
				o <= 2'b11;
				currentstate <= 2'b11;
			end
			default :  begin
				o <= 2'b00;
				currentstate <= 2'b00;
			end
		endcase
	end
`endif
endmodule

