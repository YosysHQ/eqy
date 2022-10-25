`ifdef GOLD
module top(input A, B, C, output [1:0] X, Y);
  assign X = A + B, Y = A + C;
endmodule
`endif

`ifdef GATE
module top(input A, B, C, output [1:0] X, Y);
  assign X[0] = A ^ B;
  assign X[1] = A & B;
  assign Y[0] = A ^ C;
  assign Y[1] = A & C;
endmodule
`endif
