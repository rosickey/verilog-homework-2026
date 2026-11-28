// top_tb.v
`timescale 1ns/1ns

module top_tb;
    reg [7:0] zkb;
    reg [7:0] zq;
    wire clk;

    // 实例化频率、占空比可调的信号发生器
    clk_gen_o uut(zkb, zq, clk);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        // 第一种参数：周期 20ns，占空比 50%
        zq  = 8'd20;
        zkb = 8'd50;
        #200;

        // 第二种参数：周期 50ns，占空比 80%
        zq  = 8'd50;
        zkb = 8'd20;
        #400;

        $finish;
    end
endmodule
