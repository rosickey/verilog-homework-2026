// top_tb.v
// 第三次作业：两位十进制计数器仿真
// u_units 为个位，u_tens 为十位。
// 个位每来一个时钟沿加 1；个位从 9 回到 0 时，cout 由 1 变 0，
// 取反后 carry 产生上升沿，使十位加 1，从而实现 00~99 计数。

`timescale 1ns/1ps

module top_tb;

    wire clk;
    reg  reset;
    reg  inhibit;

    wire cout_units;
    wire cout_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;

    wire carry;

    clk_gen u_clk_gen(clk);

    cd4017 u_units(clk, reset, inhibit, cout_units, q_units);

    assign carry = ~cout_units;

    cd4017 u_tens(carry, reset, inhibit, cout_tens, q_tens);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial
    begin
        reset   = 1;
        inhibit = 0;

        #25 reset = 0;

        #2045 $finish;
    end

endmodule
