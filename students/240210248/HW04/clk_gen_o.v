// clk_gen_o.v
// 频率、占空比可调的方波发生器：PERIOD 为周期（ns），DUTY 为高电平占空比（%）
`timescale 1ns/1ps

module clk_gen_o(clk);

    output      clk;
    reg         clk;

    parameter   PERIOD = 20;            // 时钟周期，单位 ns
    parameter   DUTY   = 50;            // 占空比，单位 %

    localparam  T_HIGH = PERIOD * DUTY / 100;   // 高电平时间，单位 ns
    localparam  T_LOW  = PERIOD - T_HIGH;       // 低电平时间，单位 ns

    initial     clk = 1'b0;             // 上电先置低

    always begin
        #(T_LOW)  clk = 1'b1;           // 低电平结束，翻转为高
        #(T_HIGH) clk = 1'b0;           // 高电平结束，翻转为低
    end

endmodule
