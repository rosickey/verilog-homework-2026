`timescale 1ns/1ns

//==============================================================================
// File        : top_tb.v
// Description : 例化 clk_gen_o，测试两种频率与占空比配置
//==============================================================================
module top_tb;

    // 实例 1：周期 100 ns → 10 MHz，占空比 50%
    reg  [7:0] zkb1;
    reg  [7:0] zq1;
    wire       clk1;

    // 实例 2：周期 200 ns → 5 MHz，占空比 30%
    reg  [7:0] zkb2;
    reg  [7:0] zq2;
    wire       clk2;

    clk_gen_o u_clk1 (
        .zkb(zkb1),
        .zq (zq1),
        .clk(clk1)
    );

    clk_gen_o u_clk2 (
        .zkb(zkb2),
        .zq (zq2),
        .clk(clk2)
    );

    initial begin
        // 0 时刻给出两组配置
        zkb1 = 8'd50; zq1 = 8'd100;   // 10 MHz, 50%
        zkb2 = 8'd30; zq2 = 8'd200;   // 5 MHz,  30%
        #1000;                        // 仿真 1000 ns
        $stop;
    end

    // 导出波形，供仿真器 / GTKWave 查看
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

endmodule
