`timescale 1ns/1ps

// 频率、占空比可调的方波发生器
// zq  : 时钟周期，单位 ns，频率 f = 1000 / zq (MHz)
// zkb : 高电平占空比，单位 %（0~100）
module clk_gen_o(zkb,zq,clk);
	input [7:0] zkb;
	input [7:0] zq;
	output clk;
	reg clk;
	integer high;

	initial
	begin
		clk = 0;
		forever
		begin
			high = zq * zkb / 100;			// 一个周期内的高电平时间
			if (high < 1) high = 1;			// 占空比为0%时避免零延时死循环
			if (high > zq - 1) high = zq - 1;	// 占空比为100%时避免零延时死循环
			#(zq - high) clk = 1;
			#(high) clk = 0;
		end
	end
endmodule
