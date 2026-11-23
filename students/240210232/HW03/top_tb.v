`timescale 1ns/1ps

module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_ones;
	wire cout_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;
	wire clk_tens;

	// 个位计数到9时cout为高，取反后在其回到0的瞬间产生十位的进位时钟
	assign clk_tens = ~cout_ones;

	// 把一组独热码还原成十进制数字，便于在波形上直接观察两位数
	wire [3:0] ones;
	wire [3:0] tens;
	wire [7:0] number;

	assign ones   = onehot2dec(q_ones);
	assign tens   = onehot2dec(q_tens);
	assign number = {tens,ones};	// 十六进制显示即为00~99

	function [3:0] onehot2dec;
		input [9:0] q;
		integer i;
		begin
			onehot2dec = 4'd0;
			for (i = 0; i < 10; i = i + 1)
				if (q[i])
					onehot2dec = i;
		end
	endfunction

	clk_gen u_clk(clk);
	cd4017 u_ones(clk,reset,inhibit,cout_ones,q_ones);
	cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars(0,top_tb);

		reset = 1'b1;
		inhibit = 1'b0;

		#25 reset = 1'b0;

		#2100 $finish;
	end
endmodule
