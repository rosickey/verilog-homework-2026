// top_tb.v
// 测试程序：实例化四个不同频率、不同占空比的 clk_gen_o，比较输出波形
`timescale 1ns/1ps

module top_tb;

    wire        clk_50m_50;             // 20 ns 周期，占空比 50%
    wire        clk_50m_20;             // 20 ns 周期，占空比 20%
    wire        clk_25m_50;             // 40 ns 周期，占空比 50%
    wire        clk_10m_80;             // 100 ns 周期，占空比 80%

    // 参数按位置依次为周期（ns）和占空比（%）
    clk_gen_o #(20, 50)   u_clk_50m_50(clk_50m_50);
    clk_gen_o #(20, 20)   u_clk_50m_20(clk_50m_20);
    clk_gen_o #(40, 50)   u_clk_25m_50(clk_25m_50);
    clk_gen_o #(100, 80)  u_clk_10m_80(clk_10m_80);

    initial begin                       // 波形文件，供 GTKWave 查看
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial #400 $finish;               // 仿真 400 ns，覆盖各时钟的多个周期

endmodule
