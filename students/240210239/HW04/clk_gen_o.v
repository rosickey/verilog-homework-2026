module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;			// 占空比 0~100
	input [7:0] zq;				// 周期（时间单位，需 ≥2）
	output clk;
	reg clk;
	integer high;
	integer low;

	initial
	begin
		clk = 1'b0;
	end

	always
	begin
		high = zq * zkb / 100;
		if (high < 1)      high = 1;        // 至少 1，避免 #0
		if (high > zq - 1) high = zq - 1;   // 留 1 给低电平，周期不变
		low = zq - high;

		if (clk == 1'b0)
			#(low)  clk = 1'b1;
		else
			#(high) clk = 1'b0;
	end
endmodule
