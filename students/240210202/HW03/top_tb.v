`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg reset;
    wire ones_cout;
    wire tens_clk;
    wire tens_cout;
    wire [9:0] ones_q;
    wire [9:0] tens_q;

    clk_gen u_clk(.clk(clk));

    cd4017 u_ones(
        .clk(clk),
        .reset(reset),
        .inhibit(1'b0),
        .cout(ones_cout),
        .q(ones_q)
    );

    // cout falls when the ones digit rolls over from 9 to 0.
    assign tens_clk = ~ones_cout;

    cd4017 u_tens(
        .clk(tens_clk),
        .reset(reset),
        .inhibit(1'b0),
        .cout(tens_cout),
        .q(tens_q)
    );

    initial
    begin
        $dumpfile("hw03.vcd");
        $dumpvars(0, top_tb);
        reset = 1'b1;
        #5 reset = 1'b0;
        #2200 $finish;
    end
endmodule
