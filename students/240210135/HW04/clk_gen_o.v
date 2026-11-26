`timescale 1ns/1ns

//==============================================================================
// File        : clk_gen_o.v
// Description : 激励信号模块，根据占空比 zkb 与周期 zq 输出方波
// Port        : zkb - 占空比 (%)，0~100
//               zq  - 方波周期 (ns)
//               clk - 输出方波
// Note        : 行为级仿真模型，使用 # 延时建模，不可综合
//==============================================================================
module clk_gen_o(zkb, zq, clk);
    input  [7:0] zkb;    // 占空比，单位 %
    input  [7:0] zq;     // 周期，单位 ns
    output reg   clk;    // 输出方波

    integer high;        // 高电平持续时间 (ns)
    integer low;         // 低电平持续时间 (ns)

    initial
    begin
        clk = 0;
        forever
        begin
            high = zq * zkb / 100;   // 高电平时间 = 周期 × 占空比
            low  = zq - high;        // 低电平时间 = 周期 - 高电平时间
            if (high < 1) high = 1;  // 防止延时为 0
            if (low  < 1) low  = 1;
            #(low)  clk = 1;         // 先维持低电平 low ns，再拉高
            #(high) clk = 0;         // 维持高电平 high ns，再拉低
        end
    end

endmodule
