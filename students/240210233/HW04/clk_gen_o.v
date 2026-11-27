`timescale 1ns/1ps
module clk_gen_o(clk);
	parameter PERIOD = 20;		// 时钟周期，单位 ns
	parameter DUTY   = 50;		// 占空比，单位 %
	output clk;
	reg clk;
	localparam HIGH = (PERIOD * DUTY) / 100;	// 高电平持续时间，单位 ns
	localparam LOW  = PERIOD - HIGH;		// 低电平持续时间，单位 ns

	initial
	begin
		clk = 0;
		forever
		begin
			#(LOW)  clk = 1;
			#(HIGH) clk = 0;
		end
	end
endmodule
