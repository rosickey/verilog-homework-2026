// top_tb.v
// 第四次作业：测试 clk_gen_o 在不同参数下的输出
// 同时产生三路方波，覆盖三种频率与三种占空比，参数用位置方式给出。

`timescale 1ns/1ps

module top_tb;

    wire clk_50m_50;
    wire clk_25m_25;
    wire clk_100m_80;

    // PERIOD = 20 ns -> 50 MHz,  DUTY = 50 %
    clk_gen_o #(20, 50) u_clk_50m_50(clk_50m_50);

    // PERIOD = 40 ns -> 25 MHz,  DUTY = 25 %
    clk_gen_o #(40, 25) u_clk_25m_25(clk_25m_25);

    // PERIOD = 10 ns -> 100 MHz, DUTY = 80 %
    clk_gen_o #(10, 80) u_clk_100m_80(clk_100m_80);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial
    begin
        #120 $finish;
    end

endmodule
