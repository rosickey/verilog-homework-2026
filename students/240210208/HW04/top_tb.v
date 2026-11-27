`timescale 1ns/1ps

module top_tb;
    reg [7:0] zkb1,zq1,zkb2,zq2;
    wire clk1,clk2;

    clk_gen u_clk1(clk1,zkb1,zq1);
    clk_gen u_clk2(clk2,zkb2,zq2);

    initial
    begin
        zkb1=25;
        zq1=40;
        zkb2=60;
        zq2=100;
        #600 $finish;
    end

    initial
    begin
        $dumpfile("done.vcd");
        $dumpvars(0,top_tb);
    end
endmodule
