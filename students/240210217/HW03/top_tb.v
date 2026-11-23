`timescale 1ns/1ps
module top_tb;
	wire clk;
	wire clk_tens;
	reg reset;
	reg inhibit;
	wire cout_units;
	wire cout_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;
	wire [3:0] units_cnt;
	wire [3:0] tens_cnt;

	clk_gen u_clk_gen(clk);
	cd4017 u_units(clk, reset, inhibit, cout_units, q_units);
	assign clk_tens = ~cout_units;
	cd4017 u_tens(clk_tens, reset, inhibit, cout_tens, q_tens);
	assign units_cnt = u_units.count;
	assign tens_cnt = u_tens.count;

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);

		reset=1;
		inhibit=0;
		#25 reset=0;

		#2100 $finish;
	end
endmodule
