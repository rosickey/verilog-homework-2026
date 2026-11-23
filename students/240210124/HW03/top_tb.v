// top_tb.v
`timescale 1ns/1ns

module top_tb;
    wire        clk;
    reg         reset;
    reg         inhibit;
    wire        cout_ones;
    wire        cout_tens;
    wire [9:0]  q_ones;
    wire [9:0]  q_tens;

    // 实例化激励信号模块（方波时钟）
    clk_gen u_clk(clk);

    // 实例化个位计数器，每来一个时钟加 1
    cd4017 u_ones(clk, reset, inhibit, cout_ones, q_ones);

    // 实例化十位计数器，个位计满 9 回 0 时进位加 1
    cd4017 u_tens(~cout_ones, reset, inhibit, cout_tens, q_tens);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        reset = 1'b1;
        inhibit = 1'b0;
        #20 reset = 1'b0;
        #400 $finish;
    end
endmodule
