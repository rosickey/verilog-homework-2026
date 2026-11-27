`timescale 1ns / 1ps

module clk_gen_o(clk);
    output clk;
    reg clk;

    parameter PERIOD = 20;
    parameter DUTY   = 50;

    parameter HIGH_TIME = PERIOD * DUTY / 100;
    parameter LOW_TIME  = PERIOD - HIGH_TIME;

    // PERIOD: 时钟周期，单位 ns，决定频率 f = 1000 / PERIOD (MHz)
    // DUTY  : 高电平占整个周期的百分比（1~99），决定占空比
    // 二者在例化时通过 defparam 修改，即可得到不同频率与占空比的方波

    initial begin
        clk = 1'b0;
        forever begin
            #LOW_TIME  clk = 1'b1;
            #HIGH_TIME clk = 1'b0;
        end
    end
endmodule
