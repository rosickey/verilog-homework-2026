`timescale 1ns/1ps
module top_tb;
    reg [7:0] zq;
    reg [7:0] zkb;
    wire clk;

    clk_gen_o u_clk(zkb,zq,clk);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0,top_tb);
        zq=20;
        zkb=25;
        #200 zq=40;
        zkb=50;
        #240 zq=80;
        zkb=75;
        #400 $finish;
    end
endmodule
