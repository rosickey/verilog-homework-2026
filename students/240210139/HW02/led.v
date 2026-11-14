`timescale 1ns/1ps

// led.v
// HW02 led 模块：课堂订正版，输出跟随输入时钟
module led(clk, out);
	input clk;
	output out;

	assign out = clk;
endmodule
