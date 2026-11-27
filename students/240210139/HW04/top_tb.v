`timescale 1ns/1ps

module top_tb;
	wire clk1;
	wire clk2;
	wire clk3;

	clk_gen_o #(20, 10) u_clk1(clk1);
	clk_gen_o #(40, 10) u_clk2(clk2);
	clk_gen_o #(50, 40) u_clk3(clk3);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial
	begin
		#400 $finish;
	end
endmodule
