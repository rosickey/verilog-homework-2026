`timescale 1ns/1ps
module top_tb;
	reg [7:0] zkb_a;
	reg [7:0] zq_a;
	reg [7:0] zkb_b;
	reg [7:0] zq_b;
	wire clk_a;
	wire clk_b;

	clk_gen_o u_clk_a(zkb_a, zq_a, clk_a);
	clk_gen_o u_clk_b(zkb_b, zq_b, clk_b);

	initial
	begin
		$dumpfile("hw04.vcd");
		$dumpvars(0, top_tb);

		// clk_a：周期 20 ns（50 MHz），占空比 25%，高电平 5 ns
		zq_a = 8'd20;
		zkb_a = 8'd25;

		// clk_b：周期 100 ns（10 MHz），占空比 80%，高电平 80 ns
		zq_b = 8'd100;
		zkb_b = 8'd80;

		// 在一个周期中间修改参数，新的频率和占空比从下一个完整周期开始生效
		#510;
		zq_b = 8'd40;
		zkb_b = 8'd50;

		#490 $finish;
	end
endmodule
