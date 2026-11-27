`timescale 1ns/1ns

// 四种不同的频率 / 占空比组合，验证 clk_gen_o 的参数生效
module top_tb;

	wire clk_a;
	wire clk_b;
	wire clk_c;
	wire clk_d;

	// 50 MHz，占空比 50 %
	clk_gen_o #(.PERIOD(20), .HIGH(10)) u_a(clk_a);
	// 50 MHz，占空比 25 %
	clk_gen_o #(.PERIOD(20), .HIGH(5))  u_b(clk_b);
	// 25 MHz，占空比 75 %
	clk_gen_o #(.PERIOD(40), .HIGH(30)) u_c(clk_c);
	// 100 MHz，占空比 10 %
	clk_gen_o #(.PERIOD(10), .HIGH(1))  u_d(clk_d);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
		#400 $finish;
	end

endmodule
