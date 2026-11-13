// top_tb.v
// 第二次作业：流水灯仿真
// 实例化 1 个 clk_gen、1 个 cd4017 和 8 个 led，
// cd4017 的 q[0]~q[7] 分别驱动 led0~led7，高电平依次移动即为流水灯。

`timescale 1ns/1ps

module top_tb;

    wire clk;
    reg  reset;
    reg  inhibit;
    wire cout;
    wire [9:0] q;

    wire led0;
    wire led1;
    wire led2;
    wire led3;
    wire led4;
    wire led5;
    wire led6;
    wire led7;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk, reset, inhibit, cout, q);

    led u_led0(q[0], led0);
    led u_led1(q[1], led1);
    led u_led2(q[2], led2);
    led u_led3(q[3], led3);
    led u_led4(q[4], led4);
    led u_led5(q[5], led5);
    led u_led6(q[6], led6);
    led u_led7(q[7], led7);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial
    begin
        reset   = 1;
        inhibit = 0;

        #25 reset = 0;

        #425 $finish;
    end

endmodule
