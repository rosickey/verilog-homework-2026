`timescale 1ns/1ps
module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;	// 占空比：高电平占一个周期的百分比，范围 1~99
	input [7:0] zq;		// 周期：单位 ns，范围 2~255，即频率 3.92 MHz~500 MHz
	output reg clk;
	real high_time;
	real low_time;

	initial
	begin
		clk = 1'b0;
		forever
		begin
			wait ((zq >= 2) && (zkb >= 1) && (zkb <= 99));
			high_time = 1.0 * zq * zkb / 100.0;
			low_time = zq - high_time;
			#(low_time) clk = 1'b1;
			#(high_time) clk = 1'b0;
		end
	end
endmodule
