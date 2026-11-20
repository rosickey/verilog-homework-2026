`timescale 1ns / 1ps
module top_tb;
wire clk;
wire [9:0] q1;
wire [9:0] q10;
wire cout_1;
reg reset;
reg inhibit;
clk_gen u_clk(clk);
cd4017 u_q1(clk, reset, inhibit,cout_1, q1);
cd4017 u_q10(clk, reset, ~cout_1, , q10);
initial
begin
    reset = 1'b1;
    inhibit = 1'b0;
    #10 reset = 1'b0;
    #2000 $finish;
end

initial
begin
    $dumpfile("report.vcd");
    $dumpvars(0, top_tb);
end
endmodule