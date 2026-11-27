// clk_gen_o.v
// 参数化方波发生器：PERIOD 决定输出频率，DUTY 决定高电平占空比
`timescale 1ns/1ps

module clk_gen_o(clk);

    output      clk;
    reg         clk;

    parameter   PERIOD = 20;            // 输出周期，单位 ns
    parameter   DUTY   = 50;            // 高电平占空比，单位 %

    localparam  T_ON  = PERIOD * DUTY / 100;    // 高电平持续时间，单位 ns
    localparam  T_OFF = PERIOD - T_ON;          // 低电平持续时间，单位 ns

    initial     clk = 1'b1;             // 上电先输出高电平

    always begin
        #(T_ON)  clk = 1'b0;            // 高电平结束，翻转到低电平
        #(T_OFF) clk = 1'b1;            // 低电平结束，翻转到高电平
    end

endmodule
