// clk_gen.v
// 方波激励：周期 20 ns（半周期 10 ns），先初始化再 forever 翻转，避免出现 x 态

`timescale 1ns/1ps

module clk_gen(clk);
    output clk;
    reg clk;

    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
endmodule
