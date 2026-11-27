// top_tb.v  测试三种频率与占空比组合
// clk_50MHz_50pct : zq=20ns,  zkb=50%  -> 50MHz, 占空比 50%
// clk_25MHz_25pct : zq=40ns,  zkb=25%  -> 25MHz, 占空比 25%
// clk_10MHz_80pct : zq=100ns, zkb=80%  -> 10MHz, 占空比 80%
`timescale 1ns/1ps

module top_tb;
	reg [7:0] zkb0=8'd50;
	reg [7:0] zq0 =8'd20;
	reg [7:0] zkb1=8'd25;
	reg [7:0] zq1 =8'd40;
	reg [7:0] zkb2=8'd80;
	reg [7:0] zq2 =8'd100;

	wire clk_50MHz_50pct;
	wire clk_25MHz_25pct;
	wire clk_10MHz_80pct;

	clk_gen_o u_clk_gen0(zkb0,zq0,clk_50MHz_50pct);
	clk_gen_o u_clk_gen1(zkb1,zq1,clk_25MHz_25pct);
	clk_gen_o u_clk_gen2(zkb2,zq2,clk_10MHz_80pct);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		#400 $finish;
	end
endmodule
