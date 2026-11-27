`timescale 1ns/1ps

// clk_gen_o.v
// HW04 激励信号模块：频率、占空比可调的方波发生器
// 参数 PERIOD：方波周期（单位 ns），决定输出频率
// 参数 HIGH  ：高电平持续时间（单位 ns），占空比 = HIGH / PERIOD
module clk_gen_o(clk);
	parameter PERIOD = 20;
	parameter HIGH = 10;
	output reg clk;

	initial
	begin
		clk = 0;
		forever
		begin
			#(PERIOD - HIGH) clk = 1;
			#HIGH clk = 0;
		end
	end
endmodule
