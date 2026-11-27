`timescale 1ns/1ps

module top_tb;

	reg [7:0] zkb;
	reg [7:0] zq;
	wire clk;

	clk_gen_o uut(zkb,zq,clk);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		zq=8'd20;
		zkb=8'd25;
		#200;
		zq=8'd40;
		zkb=8'd50;
		#400;
		zq=8'd80;
		zkb=8'd75;
		#400;
		$finish;
	end

endmodule
