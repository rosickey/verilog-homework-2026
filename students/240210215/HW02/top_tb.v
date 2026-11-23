// top_tb.v
// 测试程序：实例化 clk_gen、一个 cd4017 和八个 led，实现 8 位流水灯仿真
`timescale 1ns/1ps

module top_tb;

    wire        clk;                    // 时钟：由 clk_gen 产生
    reg         reset;                  // 清零端：高电平异步清零
    reg         inhibit;                // 使能端：高电平时计数保持
    wire        cout;                   // 进位输出：计数到 9 时为高
    wire [9:0]  q;                      // CD4017 十路译码输出
    wire [7:0]  led;                    // 八个 LED 的驱动输出

    // 时钟激励模块
    clk_gen u_clk_gen(clk);

    // 被测试的十进制计数器
    cd4017 u_cd4017(clk, reset, inhibit, cout, q);

    // 八个 LED：分别由 Q0~Q7 驱动，输出端依次点亮形成流水灯
    led u_led0(q[0], led[0]);
    led u_led1(q[1], led[1]);
    led u_led2(q[2], led[2]);
    led u_led3(q[3], led[3]);
    led u_led4(q[4], led[4]);
    led u_led5(q[5], led[5]);
    led u_led6(q[6], led[6]);
    led u_led7(q[7], led[7]);

    initial begin                       // 波形文件，供 GTKWave 查看
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        reset   = 1'b1;                 // 先异步清零，输出停在 Q0
        inhibit = 1'b0;                 // 允许计数
        #25  reset = 1'b0;              // 放开清零，LED 从 Q0 开始依次流水
        #400 $finish;                   // 仿真 400 ns，流水灯循环两轮
    end

endmodule
