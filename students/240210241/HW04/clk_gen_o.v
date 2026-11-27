// HW04 频率、占空比可调的信号发生器
// 由课堂订正的 clk_gen.v 改造：把固定的 #10 反相改为按占空比 zkb、周期 zq 分两段延时
module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;	// 占空比，单位 %，取值 1~99
	input [7:0] zq;		// 周期，时间单位与仿真时间单位一致（约定为 ns）
	output clk;

	reg clk;
	integer high;		// 高电平时间

	initial
	begin
		clk = 0;
		forever
		begin
			high = zq * zkb / 100;
			#(zq - high) clk = 1;
			#(high) clk = 0;
		end
	end
endmodule
