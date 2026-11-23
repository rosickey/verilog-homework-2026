`timescale 1ns / 1ps

module top_tb;
    wire clk;
    reg  reset;
    reg  inhibit;
    wire cout_unit;
    wire cout_tens;
    wire [9:0] q_unit;
    wire [9:0] q_tens;

    clk_gen u_clk_gen(clk);
    cd4017  u_unit(clk, reset, inhibit, cout_unit, q_unit);
    cd4017  u_tens(clk, reset, ~cout_unit, cout_tens, q_tens);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset   = 1'b1;
        inhibit = 1'b0;
        #25  reset = 1'b0;
        #2175 $finish;
    end

    initial begin
        $monitor("time=%0t  q_tens=%b  q_unit=%b", $time, q_tens, q_unit);
    end
endmodule
