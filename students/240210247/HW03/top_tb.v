`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire tens_clk;
    wire cout_ones;
    wire cout_tens;
    wire [9:0] q_ones;
    wire [9:0] q_tens;

    clk_gen u_clk_gen(clk);

    assign tens_clk = ~cout_ones;

    cd4017 u_cd4017_ones(clk,reset,inhibit,cout_ones,q_ones);
    cd4017 u_cd4017_tens(tens_clk,reset,inhibit,cout_tens,q_tens);

    initial
    begin
        $dumpfile("hw03.vcd");
        $dumpvars(0,top_tb);

        inhibit = 1'b0;
        reset = 1'b1;
        #25 reset = 1'b0;
        #2100 $finish;
    end
endmodule
