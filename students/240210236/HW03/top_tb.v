`timescale 1ns/1ns

module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire clk_ten;
	wire cout_unit;
	wire cout_ten;
	wire [9:0] q_unit;
	wire [9:0] q_ten;

	assign clk_ten = ~cout_unit;

	clk_gen u_clk(clk);
	cd4017 u_unit(clk,reset,inhibit,cout_unit,q_unit);
	cd4017 u_ten(clk_ten,reset,inhibit,cout_ten,q_ten);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#2050 $finish;
	end
endmodule
