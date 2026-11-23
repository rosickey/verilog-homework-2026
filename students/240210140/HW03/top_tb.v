`timescale 1ns/1ps

// top_tb.v
// HW03 测试程序：实例化 clk_gen 和两个 cd4017（个位、十位）实现两位十进制计数器
module top_tb;
	reg reset;
	wire clk;
	wire cout_low;
	wire cout_high;
	wire [9:0] q_low;
	wire [9:0] q_high;

	// 方波时钟激励：周期 20ns
	clk_gen u_clk_gen(clk);

	// 个位：直接由 clk_gen 产生的时钟驱动
	cd4017 u_cd4017_low(clk, reset, 1'b0, cout_low, q_low);

	// 十位：由个位进位 cout_low 驱动，计满 10 个脉冲进一位
	cd4017 u_cd4017_high(cout_low, reset, 1'b0, cout_high, q_high);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		// 上电异步复位
		reset = 1;
		#25;
		reset = 0;

		// 仿真足够长时间，覆盖两位十进制进位过程
		#1000;
		$finish;
	end
endmodule
