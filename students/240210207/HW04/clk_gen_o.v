`timescale 1ns/1ps
module clk_gen_o(zkb,zq,clk);
	input[7:0] zkb;
	input[7:0] zq;
	output reg clk;
	integer high;
	initial begin
		clk=1'b0;
		forever
		begin
			high=zq*zkb/100;
			#(zkb-high) clk=1;
			#(high)clk=0;
		end
	end
endmodule