`timescale 1ns/1ps

// clk_gen.v
// HW02 激励信号模块：方波时钟（课堂订正版）
module clk_gen(clk);
	output reg clk;

	initial
	begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule
