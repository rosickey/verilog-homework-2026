`timescale 1ns/1ps
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_units;
	wire cout_tens;
	wire [9:0] q_units;
	wire [9:0] q_tens;
	wire clk_tens;

	assign clk_tens = ~cout_units;

	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017_units(clk,reset,inhibit,cout_units,q_units);
	cd4017 u_cd4017_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		reset=1;
		inhibit=0;
		#25 reset=0;
		#1000 inhibit=1;
		#100 inhibit=0;
		#1100 reset=1;
		#60 reset=0;
		#200 $finish;
	end
endmodule
