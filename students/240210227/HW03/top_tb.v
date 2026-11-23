`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire clk_tens;
    wire cout_ones;
    wire cout_tens;
    wire[9:0] q_ones;
    wire[9:0] q_tens;

    clk_gen u_clk(clk);
    cd4017 u_ones(clk,reset,inhibit,cout_ones,q_ones);
    assign clk_tens=~cout_ones;
    cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0,top_tb);
        reset=1;
        inhibit=0;
        #25 reset=0;
        #2040 $finish;
    end
endmodule
