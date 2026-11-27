`timescale 1ns/1ps

module top_tb;
        reg  [7:0] zkb_a;
        reg  [7:0] zq_a;
        reg  [7:0] zkb_b;
        reg  [7:0] zq_b;
        wire       clk_a;
        wire       clk_b;

        clk_gen_o u_a(zkb_a, zq_a, clk_a);
        clk_gen_o u_b(zkb_b, zq_b, clk_b);

        initial begin
                zkb_a = 8'd70;
                zq_a  = 8'd20;
                zkb_b = 8'd17;
                zq_b  = 8'd30;

                $dumpfile("report.vcd");
                $dumpvars(0, top_tb);

                #2000 $finish;
        end

        initial
                $monitor("time=%0t  clk_a=%b  clk_b=%b", $time, clk_a, clk_b);
endmodule
