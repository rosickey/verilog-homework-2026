`timescale 1ns / 1ps

module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire units_cout;
	wire units_clk;
	wire tens_cout;
	wire [9:0] units_q;
	wire [9:0] tens_q;

	// 20 ns square-wave stimulus.
	clk_gen u_clk(clk);

	// Units digit: counts every clock.
	cd4017 u_units(clk,reset,inhibit,units_cout,units_q);

	// cout is high at count 9, so invert it: the tens digit then sees a
	// rising edge when the units digit rolls 9 -> 0.
	assign units_clk = ~units_cout;
	cd4017 u_tens(units_clk,reset,inhibit,tens_cout,tens_q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		reset =1;
		inhibit =0;
		#25 reset =0;
		#2050 $finish();
	end
endmodule
