`timescale 1ns/1ns
module clk_gen_o(clk);
	output reg clk;
	parameter period = 100;		// 方波周期，单位：ns
	parameter duty = 50;		// 高电平占空比，单位：%
	initial
	begin
		clk = 0;
		forever
		begin
			#(period * (100 - duty) / 100) clk = 1;
			#(period * duty / 100) clk = 0;
		end
	end
endmodule
