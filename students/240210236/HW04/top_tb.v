`timescale 1ns/1ns

module top_tb;

	wire clk_50M_50;
	wire clk_50M_20;
	wire clk_25M_50;
	wire clk_10M_10;

	clk_gen_o u_50m_50(8'd50, 8'd20, clk_50M_50);
	clk_gen_o u_50m_20(8'd20, 8'd20, clk_50M_20);
	clk_gen_o u_25m_50(8'd50, 8'd40, clk_25M_50);
	clk_gen_o u_10m_10(8'd10, 8'd100, clk_10M_10);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
		#300 $finish;
	end

endmodule
