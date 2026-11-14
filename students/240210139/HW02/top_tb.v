`timescale 1ns/1ps

// top_tb.v
// HW02 测试程序：实例化一个 cd4017 与八个 led，实现八个流水灯
// 流水原理：cd4017 的 q[7:0] 依次有一个输出为高，驱动对应 led 点亮，
//          每来一个时钟高电平向后移动一位，形成流水效果
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout;
	wire [9:0] q;

	// 送到八个 led 的输入，以及八个 led 的输出
	wire led_in0, led_in1, led_in2, led_in3, led_in4, led_in5, led_in6, led_in7;
	wire led0, led1, led2, led3, led4, led5, led6, led7;

	// 激励信号模块
	clk_gen u_clk(clk);

	// 计数器模块
	cd4017 u_cd4017(clk, reset, inhibit, cout, q);

	// q[7:0] 接到八个 led 的输入
	assign led_in0 = q[0];
	assign led_in1 = q[1];
	assign led_in2 = q[2];
	assign led_in3 = q[3];
	assign led_in4 = q[4];
	assign led_in5 = q[5];
	assign led_in6 = q[6];
	assign led_in7 = q[7];

	// 八个 led 模块
	led u_led0(led_in0, led0);
	led u_led1(led_in1, led1);
	led u_led2(led_in2, led2);
	led u_led3(led_in3, led3);
	led u_led4(led_in4, led4);
	led u_led5(led_in5, led5);
	led u_led6(led_in6, led6);
	led u_led7(led_in7, led7);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
	end

	initial
	begin
		reset = 1;
		inhibit = 0;
		#15 reset = 0;
		#400 $finish;
	end
endmodule
