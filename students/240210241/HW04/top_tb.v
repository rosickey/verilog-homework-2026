// HW04 测试程序：三个 clk_gen_o 实例，输出不同频率与占空比
module top_tb;
	reg [7:0] zq_20;
	reg [7:0] zkb_50;
	reg [7:0] zq_40;
	reg [7:0] zkb_25;
	reg [7:0] zq_100;
	reg [7:0] zkb_75;

	wire clk_20_50;
	wire clk_40_25;
	wire clk_100_75;

	// 周期 20、占空比 50%
	clk_gen_o u_clk_20_50 (zkb_50, zq_20, clk_20_50);

	// 周期 40（频率减半）、占空比 25%
	clk_gen_o u_clk_40_25 (zkb_25, zq_40, clk_40_25);

	// 周期 100（低频）、占空比 75%
	clk_gen_o u_clk_100_75 (zkb_75, zq_100, clk_100_75);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);

		zq_20 = 20;
		zkb_50 = 50;
		zq_40 = 40;
		zkb_25 = 25;
		zq_100 = 100;
		zkb_75 = 75;

		#1000 $finish;
	end
endmodule
