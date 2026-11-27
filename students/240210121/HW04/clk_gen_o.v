`timescale 1ns/1ps
module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;		// 占空比（百分比 0~100）
	input [7:0] zq;			// 时钟周期（时间单位）
	output clk;
	reg clk;
	integer high;

	initial
	begin
		clk = 1'b0;
	end

	always
	begin
		high = zq * zkb / 100;
		if (clk == 1'b0)
			#(zq - high) clk = 1'b1;
		else
			#(high) clk = 1'b0;
	end
endmodule
