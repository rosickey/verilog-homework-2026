// top_tb.v
// 测试程序：实例化 clk_gen 和两个 cd4017，实现两位十进制计数器（00~99）
`timescale 1ns/1ps

module top_tb;

    wire        clk;                    // 时钟：由 clk_gen 产生
    reg         reset;                  // 清零端：高电平异步清零
    wire        carry;                  // 个位计满 9 后产生的进位时钟
    wire        cout_u;                 // 个位进位输出
    wire        cout_t;                 // 十位进位输出
    wire [9:0]  q_u;                    // 个位十进制输出
    wire [9:0]  q_t;                    // 十位十进制输出

    // 时钟激励模块
    clk_gen u_clk_gen(clk);

    // 个位计数器：时钟直接取自 clk
    cd4017 u_units(clk, reset, 1'b0, cout_u, q_u);

    // 十位计数器：个位由 9 回 0 时 cout_u 下降，取反后产生上升沿，十位加 1
    assign carry = ~cout_u;
    cd4017 u_tens(carry, reset, 1'b0, cout_t, q_t);

    initial begin                       // 波形文件，供 GTKWave 查看
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        reset = 1'b1;                   // 先异步清零，个位和十位都显示 0
        #25  reset = 1'b0;              // 放开清零，个位从 0 开始计数
        #600 $finish;                   // 仿真到 30，个位计满 3 轮，十位进位 3 次
    end

endmodule
