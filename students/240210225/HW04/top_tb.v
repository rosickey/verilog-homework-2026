`timescale 1ns/1ps
module top_tb;
	reg [7:0] zkb;
	reg [7:0] zq;
	wire clk;

	clk_gen_o uut(zkb, zq, clk);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		// 第一种：周期 20ns，占空比 50%
		zq  = 8'd20;
		zkb = 8'd50;
		#200;

		// 第二种：周期 40ns，占空比 25%
		zq  = 8'd40;
		zkb = 8'd25;
		#400;

		$finish;
	end
endmodule
