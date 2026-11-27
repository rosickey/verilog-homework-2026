`timescale 1ns/1ps
// 频率、占空比可调的方波信号发生器
// zkb：占空比（百分比 0~100）
// zq  ：时钟周期，单位 ns
module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;
	input [7:0] zq;
	output clk;
	reg clk;
	integer high;
	integer low;

	initial
	begin
		clk = 1'b0;
	end

	always
	begin
		high = zq * zkb / 100;
		low = zq - high;
		if (high < 1)
			high = 1;
		if (low < 1)
			low = 1;
		#(low) clk = 1'b1;
		#(high) clk = 1'b0;
	end
endmodule
