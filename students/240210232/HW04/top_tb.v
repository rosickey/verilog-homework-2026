`timescale 1ns/1ps

module top_tb;
	reg [7:0] zkb_a;
	reg [7:0] zq_a;
	reg [7:0] zkb_b;
	reg [7:0] zq_b;
	reg [7:0] zkb_c;
	reg [7:0] zq_c;
	reg [7:0] zkb_d;
	reg [7:0] zq_d;
	wire clk_a;
	wire clk_b;
	wire clk_c;
	wire clk_d;

	// 以下四路分别测试不同的频率与占空比
	clk_gen_o u_a(zkb_a,zq_a,clk_a);	// 50 MHz, 50%
	clk_gen_o u_b(zkb_b,zq_b,clk_b);	// 50 MHz, 25%
	clk_gen_o u_c(zkb_c,zq_c,clk_c);	// 25 MHz, 75%
	clk_gen_o u_d(zkb_d,zq_d,clk_d);	// 10 MHz, 10%

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars(0,top_tb);

		zkb_a = 8'd50;	zq_a = 8'd20;
		zkb_b = 8'd25;	zq_b = 8'd20;
		zkb_c = 8'd75;	zq_c = 8'd40;
		zkb_d = 8'd10;	zq_d = 8'd100;

		#305 zkb_a = 8'd20;	// 运行中修改占空比：50% -> 20%

		#195 $finish;
	end
endmodule
