`timescale 1ns/1ps

module clk_gen_o(clk);
	parameter PERIOD = 20;
	parameter HIGH = 10;
	output reg clk;

	initial
	begin
		clk = 0;
		forever
		begin
			#(PERIOD - HIGH) clk = 1;
			#HIGH clk = 0;
		end
	end
endmodule
