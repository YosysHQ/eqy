`ifdef GOLD
module top(input A, B, C, output X, Y, Z);
  assign X = A ^ B;
  assign Y = B ^ C;
  assign Z = X ^ Y;
endmodule
`endif

`ifdef GATE
module top(input A, B, C, output X, Y, Z);
  assign X = A ^ B;
  assign Y = B ^ C;
  assign Z = A ^ C;
endmodule
`endif
