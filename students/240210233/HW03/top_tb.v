`timescale 1ns/1ps
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_u;
	wire cout_t;
	wire [9:0] q_u;
	wire [9:0] q_t;
	
	clk_gen u_clk(clk);
	cd4017 u_units(clk, reset, inhibit, cout_u, q_u);
	cd4017 u_tens(~cout_u, reset, inhibit, cout_t, q_t);
	
	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#2075 $finish;
	end
endmodule
