`timescale 1ns/1ns
module top_tb;
	wire clk_a;		// 10 MHz，占空比 50%
	wire clk_b;		// 4 MHz，占空比 20%
	wire clk_c;		// 5 MHz，占空比 75%

	clk_gen_o #(100, 50) u_clk_a(clk_a);
	clk_gen_o #(250, 20) u_clk_b(clk_b);
	clk_gen_o #(200, 75) u_clk_c(clk_c);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		#1000 $finish;
	end
endmodule
