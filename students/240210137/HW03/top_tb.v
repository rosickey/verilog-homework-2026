`timescale 1ns/1ns
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout0;
	wire cout1;
	wire [9:0] q_units;
	wire [9:0] q_tens;

	clk_gen u_clk_gen(clk);
	cd4017 u_units(clk,reset,inhibit,cout0,q_units);
	cd4017 u_tens(~cout0,reset,inhibit,cout1,q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#2010 $finish;
	end
endmodule
