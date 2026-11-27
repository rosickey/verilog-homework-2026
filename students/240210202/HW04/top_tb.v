`timescale 1ns/1ps
module top_tb;
    reg [7:0] zq;
    reg [7:0] zkb;
    wire clk;

    clk_gen u_clk(.clk(clk), .zkb(zkb), .zq(zq));

    initial
    begin
        $dumpfile("hw04.vcd");
        $dumpvars(0, top_tb);

        // 20 ns period: 50 MHz, 25% duty cycle, 5 ns high.
        zq = 8'd20;
        zkb = 8'd25;

        // Change inputs away from a cycle boundary to avoid a testbench race.
        // The generator applies them at the next complete cycle.
        #201;
        zq = 8'd40;
        zkb = 8'd50;

        // 40 ns period: 25 MHz, 50% duty cycle, 20 ns high.
        #240;
        zq = 8'd80;
        zkb = 8'd75;

        // 80 ns period: 12.5 MHz, 75% duty cycle, 60 ns high.
        #400 $finish;
    end
endmodule
