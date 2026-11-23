`timescale 1ns / 1ps

module top_tb;
	wire clk_50m_50;
	wire clk_25m_25;
	wire clk_10m_80;

	// 20 ns period, 50% duty -> 50 MHz
	clk_gen_ov #(20,50) u_clk_50m_50(clk_50m_50);

	// 40 ns period, 25% duty -> 25 MHz
	clk_gen_ov #(40,25) u_clk_25m_25(clk_25m_25);

	// 100 ns period, 80% duty -> 10 MHz
	clk_gen_ov #(100,80) u_clk_10m_80(clk_10m_80);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		#400 $finish();
	end
endmodule
