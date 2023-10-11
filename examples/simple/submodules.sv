`ifdef GOLD


module submod(input [7:0] a, input [7:0] b, output [7:0] outp);
    assign outp = a + b;
endmodule

module top(input clk, input [7:0] a, output [7:0] b);

    reg [15:0] counter = 0;

    always @(posedge clk)
        counter <= counter + a;


    wire [7:0] tmp;

    submod submod(.a(counter[7:0]), .b(counter[15:8]), .outp(tmp));

    reg [7:0] counter2 = 0;

    always @(posedge clk)
        counter2 <= counter2 + tmp;

    assign b = counter2;

endmodule
`endif


`ifdef GATE

module submod(input [7:0] a, input [7:0] b, output [7:0] outp);
    assign outp = ((a * 7) + (b * 7)) * 183;
endmodule


module top(input clk, input [7:0] a, output [7:0] b);
    reg [15:0] counter_late = 0;
    reg [7:0] a_d = 0;


    always @(posedge clk)
        a_d <= a;

    always @(posedge clk)
        counter_late <= counter_late + a_d;

    wire [15:0] counter = counter_late + a_d;

    wire [7:0] tmp;

    submod submod(.a(counter[7:0]), .b(counter[15:8]), .outp(tmp));

    reg [7:0] neg_counter2 = 0;

    always @(posedge clk)
        neg_counter2 <= neg_counter2 - tmp;

    assign b = -neg_counter2;
endmodule

`endif
