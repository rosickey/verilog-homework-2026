`timescale 1ns/1ps
module top_tb;
	wire clk_a;
	wire clk_b;
	wire clk_c;
	wire clk_d;
	wire clk_e;

	// 20 ns 周期（50 MHz），50% 占空比：高 10 ns / 低 10 ns
	clk_gen_o #(20, 50) u_a(clk_a);
	// 40 ns 周期（25 MHz），25% 占空比：高 10 ns / 低 30 ns
	clk_gen_o #(40, 25) u_b(clk_b);
	// 20 ns 周期（50 MHz），75% 占空比：高 15 ns / 低 5 ns
	clk_gen_o #(20, 75) u_c(clk_c);
	// 10 ns 周期（100 MHz），50% 占空比：高 5 ns / 低 5 ns
	clk_gen_o #(10, 50) u_d(clk_d);
	// 100 ns 周期（10 MHz），10% 占空比：高 10 ns / 低 90 ns
	clk_gen_o #(100, 10) u_e(clk_e);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		#200 $finish;
	end
endmodule
