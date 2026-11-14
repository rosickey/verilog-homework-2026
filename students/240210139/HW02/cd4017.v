`timescale 1ns/1ps

// cd4017.v
// HW02 计数器模块：课堂订正版 CD4017，十进制计数并输出十路译码
module cd4017(clk, reset, inhibit, cout, q);
	input clk, reset, inhibit;
	output cout;
	output [9:0] q;
	reg [3:0] count;

	initial
	begin
		count = 0;
	end

	always@(posedge clk or posedge reset)
	begin
		if(reset)
			count <= 0;
		else if(!inhibit)
		begin
			if(count == 9)
				count <= 0;
			else
				count <= count + 1;
		end
	end

	assign q = 10'b0000_0000_01 << count;
	assign cout = !(count < 9);
endmodule
