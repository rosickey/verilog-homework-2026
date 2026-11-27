`timescale 1ns/1ps
module top_tb;
	reg [7:0] zkb;
	reg [7:0] zq;
	wire clk;

	clk_gen_o u_clk_gen_o(zkb,zq,clk);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		// 第一种：周期 20 ns，占空比 50%
		zq=8'd20;
		zkb=8'd50;
		#200;
		// 第二种：周期 40 ns，占空比 25%
		zq=8'd40;
		zkb=8'd25;
		#400;
		$finish;
	end
endmodule
