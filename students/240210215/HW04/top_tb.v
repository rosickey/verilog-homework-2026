// top_tb.v
// 测试程序：用三组参数验证 clk_gen_o 的频率与占空比调节功能
`timescale 1ns/1ps

module top_tb;

    wire        clk_10n;                // 10 ns 周期，占空比 50%
    wire        clk_50n;                // 50 ns 周期，占空比 20%
    wire        clk_120n;               // 120 ns 周期，占空比 75%

    // 参数依次为周期（ns）和占空比（%）
    clk_gen_o #(10, 50)   u_fast(clk_10n);
    clk_gen_o #(50, 20)   u_slow(clk_50n);
    clk_gen_o #(120, 75)  u_wide(clk_120n);

    initial begin                       // 记录波形，供 GTKWave 查看
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial #300 $finish;               // 仿真 300 ns，三路时钟均覆盖多个完整周期

endmodule
