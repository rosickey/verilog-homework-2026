// clk_gen_o.v
// 第四次作业：频率、占空比可调的方波发生器
// 在课堂订正的 clk_gen.v 基础上修改：把固定的 #10 拆成高、低两段时间，用参数控制。
//   PERIOD：一个完整周期的长度，单位 ns，频率 = 1000 / PERIOD （MHz）
//   DUTY  ：高电平占一个周期的百分比，取值 1 ~ 99
// 例如 PERIOD=20、DUTY=50 即 50 MHz、占空比 50%；PERIOD=40、DUTY=25 即 25 MHz、占空比 25%。

`timescale 1ns/1ps

module clk_gen_o(clk);

    parameter PERIOD = 20;
    parameter DUTY   = 50;

    output clk;

    reg clk;

    initial
    begin
        clk = 0;
        forever
        begin
            #(PERIOD * (100 - DUTY) / 100.0) clk = 1;
            #(PERIOD * DUTY / 100.0)         clk = 0;
        end
    end

endmodule
