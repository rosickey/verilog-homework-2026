`timescale 1ns/1ps

module top_tb;
        wire        clk;
        reg         reset;
        reg         inhibit;
        wire        cout_low, cout_high;
        wire [9:0]  q_low, q_high;

        clk_gen u_clk(clk);

        cd4017 u_low(clk, reset, inhibit, cout_low, q_low);
        cd4017 u_high(cout_low, reset, inhibit, cout_high, q_high);

        initial begin
                $dumpfile("report.vcd");
                $dumpvars(0, top_tb);

                reset   = 1'b1;
                inhibit = 1'b0;

                #25  reset = 1'b0;

                #300 inhibit = 1'b1;
                #100 inhibit = 1'b0;

                #1700 $finish;
        end

        initial
                $monitor("time=%0t  reset=%b  inhibit=%b  cout_low=%b  q_low=%b  q_high=%b",
                         $time, reset, inhibit, cout_low, q_low, q_high);
endmodule