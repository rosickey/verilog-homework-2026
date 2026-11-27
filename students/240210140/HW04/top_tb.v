`timescale 1ns/1ps

// top_tb.v
// HW04 测试程序：实例化三个 clk_gen_o，测试两种以上频率与占空比
// clk1：周期 20ns，高电平 10ns，占空比 50%，频率 50 MHz
// clk2：周期 40ns，高电平 10ns，占空比 25%，频率 25 MHz
// clk3：周期 50ns，高电平 40ns，占空比 80%，频率 20 MHz
module top_tb;
	wire clk1;
	wire clk2;
	wire clk3;

	clk_gen_o #(20, 10) u_clk1(clk1);
	clk_gen_o #(40, 10) u_clk2(clk2);
	clk_gen_o #(50, 40) u_clk3(clk3);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial
	begin
		#400;
		$finish;
	end
endmodule
