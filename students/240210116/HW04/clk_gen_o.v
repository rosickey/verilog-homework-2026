`timescale 1ns/1ns

// 频率、占空比可调的方波激励
// 周期 PERIOD，高电平时间 HIGH（单位都是 ns）
// 占空比 = HIGH / PERIOD；频率 = 1000 / PERIOD (MHz)
module clk_gen_o(clk);
	parameter PERIOD = 20;
	parameter HIGH   = 10;
	output reg clk;

	initial
	begin
		clk = 0;
		forever
		begin
			#(PERIOD - HIGH) clk = 1;
			#(HIGH)         clk = 0;
		end
	end
endmodule
