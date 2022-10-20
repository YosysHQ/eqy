`ifdef GOLD
module top(input A, B, C, output X, Y, Z);
  assign X = A + B;
  assign Y = X + C;
  assign Z = B + C;
endmodule
`endif

`ifdef GATE
module top(input A, B, C, output X, Y, Z);
  assign X = A ^ B;
  assign Y = X ^ C;
  assign Z = B ^ C;
endmodule
`endif
