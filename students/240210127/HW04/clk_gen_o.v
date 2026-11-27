`timescale 1ns / 1ps

module clk_gen_o(clk);
	parameter PERIOD = 20;      // clock period, ns
	parameter DUTY = 50;        // duty cycle, percent
	output reg clk;

	initial
	begin
		clk = 1'b0;
		forever
		begin
			#(PERIOD * (100 - DUTY) / 100.0) clk = 1'b1;
			#(PERIOD * DUTY / 100.0) clk = 1'b0;
		end
	end
endmodule
