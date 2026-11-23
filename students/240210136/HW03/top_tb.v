`timescale 1ns / 1ns
module top_tb;

// 内部信号定义
wire clk;
wire mr;
wire [9:0] q_unit;   // 个位输出
wire co_unit;         // 个位进位
wire [9:0] q_ten;    // 十位输出
wire co_ten;          // 十位进位

reg rst;

assign mr = rst;

// 实例化时钟模块：端口顺序 clk
clk_gen clock_gen(
    clk
);

// 实例化个位CD4017：端口顺序 clk, mr, q, co
cd4017 unit_cnt(
    clk,
    mr,
    q_unit,
    co_unit
);

// 实例化十位CD4017：时钟接个位进位，实现级联
cd4017 ten_cnt(
    co_unit,
    mr,
    q_ten,
    co_ten
);

initial begin
    $dumpfile("wave.vcd");    
    $dumpvars(0, top_tb);     
    
    rst = 1;
    #100;
    rst = 0;
    
    #2000;
    $finish;
end

endmodule
