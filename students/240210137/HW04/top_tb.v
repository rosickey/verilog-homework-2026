`timescale 1ns/1ns
module top_tb;
	wire clk1;
	wire clk2;

	clk_gen_o #(20, 25) u_clk1(clk1);
	clk_gen_o #(100, 60) u_clk2(clk2);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		#400 $finish;
	end
endmodule
