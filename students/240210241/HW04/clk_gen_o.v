// HW04 频率、占空比可调的信号发生器
// 在课堂订正的 clk_gen.v 基础上，把固定的 #10 反相改为两个参数：
//   PERIOD 决定频率（周期越小频率越高），DUTY 决定占空比（高电平占周期的百分比）
module clk_gen_o(clk);
	parameter PERIOD = 20;				// 周期，时间单位与仿真时间单位一致（约定为 ns）
	parameter DUTY = 50;				// 占空比，单位 %，取值 1~99

	localparam HIGH_TIME = PERIOD * DUTY / 100;	// 高电平时间
	localparam LOW_TIME = PERIOD - HIGH_TIME;	// 低电平时间

	output reg clk;

	initial
	begin
		clk = 0;
		forever
		begin
			#LOW_TIME clk = 1;
			#HIGH_TIME clk = 0;
		end
	end
endmodule
