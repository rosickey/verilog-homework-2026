`timescale 1ns/1ps

module top_tb;

	wire clk;
	reg reset;
	reg inhibit;
	wire clk_tens;
	wire cout_ones;
	wire cout_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;
	wire [3:0] ones_num;
	wire [3:0] tens_num;

	clk_gen u_clk_gen(clk);
	cd4017 u_ones(clk,reset,inhibit,cout_ones,q_ones);
	cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);
	assign clk_tens=~cout_ones;
	assign ones_num=u_ones.count;
	assign tens_num=u_tens.count;

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		reset=1'b1;
		inhibit=1'b0;
		#25 reset=1'b0;
		#970 inhibit=1'b1;
		#100 inhibit=1'b0;
		#1200 reset=1'b1;
		#20 reset=1'b0;
		#115 $finish;
	end

endmodule
