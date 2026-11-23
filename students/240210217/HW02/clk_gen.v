// clk_gen.v
// 方波激励信号模块：产生占空比 50% 的时钟，作为 CD4017 的计数时钟
`timescale 1ns/1ps
module clk_gen(clk);
		output reg clk;
		initial
		begin
			clk=0;
			forever #10 clk=~clk;
		end
endmodule
