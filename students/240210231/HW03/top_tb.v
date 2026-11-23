`timescale 1ns/1ps
module top_tb;
	wire clk;
	clk_gen u_clk_gen(clk);

	reg reset;
	reg inhibit;

	wire cout0;
	wire [9:0] q0;
	cd4017 u_unit(clk,reset,inhibit,cout0,q0);

	wire cout1;
	wire [9:0] q1;
	cd4017 u_tens(cout0,reset,inhibit,cout1,q1);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		reset=1;
		inhibit=0;
		#15 reset=0;
		#500 inhibit=1;
		#60 inhibit=0;
		#120 reset=1;
		#15 reset=0;
		#60 $finish;
	end
endmodule
