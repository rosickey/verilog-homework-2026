`timescale 1ns/1ps

module top_tb;
	wire clk;
	reg reset;
	reg inhibit;

	wire units_cout;
	wire [9:0] units_q;

	wire tens_cout;
	wire [9:0] tens_q;

	clk_gen u_clk(clk);

	cd4017 u_units(clk, reset, inhibit, units_cout, units_q);
	cd4017 u_tens(clk, reset, !units_cout, tens_cout, tens_q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial
	begin
		reset = 1;
		inhibit = 0;
		#15 reset = 0;
		#1985 $finish;
	end
endmodule
