// HW04 测试程序：实例化 4 个 clk_gen_o，验证不同频率与占空比
module top_tb;
	wire clk_20_50;
	wire clk_40_25;
	wire clk_100_75;
	wire clk_200_10;

	// 周期 20，占空比 50%（默认参数）
	clk_gen_o u_clk_20_50 (
		.clk(clk_20_50)
	);

	// 周期 40（频率减半），占空比 25%
	clk_gen_o #(.PERIOD(40), .DUTY(25)) u_clk_40_25 (
		.clk(clk_40_25)
	);

	// 周期 100（低频），占空比 75%
	clk_gen_o #(.PERIOD(100), .DUTY(75)) u_clk_100_75 (
		.clk(clk_100_75)
	);

	// 周期 200（更低频），占空比 10%
	clk_gen_o #(.PERIOD(200), .DUTY(10)) u_clk_200_10 (
		.clk(clk_200_10)
	);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);

		#800 $finish;
	end
endmodule
