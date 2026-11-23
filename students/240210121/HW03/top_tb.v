`timescale 1ns/1ps
module top_tb;
	reg reset;
	reg inhibit;
	wire clk;
	wire clk_tens;
	wire cout_unit, cout_tens;
	wire [9:0] q_unit, q_tens;

	clk_gen u_clk(clk);
	cd4017 u_unit(clk, reset, inhibit, cout_unit, q_unit);
	assign clk_tens = ~cout_unit;
	cd4017 u_tens(clk_tens, reset, inhibit, cout_tens, q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
		reset = 1;
		inhibit = 0;
		#15;
		reset = 0;
		#2050;
		$finish;
	end
endmodule
