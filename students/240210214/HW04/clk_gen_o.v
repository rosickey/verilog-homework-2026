// clk_gen_o.v  频率、占空比可调的方波发生器
// zkb：占空比，单位 %，有效范围 1~99
// zq ：周期，单位 ns，有效范围 10~200（频率 = 1000/zq MHz）
`timescale 1ns/1ps

module clk_gen_o(zkb,zq,clk);
	input  [7:0] zkb;
	input  [7:0] zq;
	output reg   clk;

	integer high;
	integer low;

	initial
	begin
		clk=0;
		forever
		begin
			high=zq*zkb/100;
			low=zq-high;
			if(high<1)
				high=1;
			if(low<1)
				low=1;
			#(low) clk=1;
			#(high) clk=0;
		end
	end
endmodule
