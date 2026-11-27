module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;	// 占空比(0~100)
	input [7:0] zq;		// 周期(ns)
	output clk;
	reg clk;

	integer hi_cnt;
	integer lo_cnt;

	initial
	begin
		clk = 0;
		forever
		begin
			hi_cnt = zq * zkb / 100;
			lo_cnt = zq - hi_cnt;
			if (hi_cnt < 1) hi_cnt = 1;
			if (lo_cnt < 1) lo_cnt = 1;
			#lo_cnt clk = 1;
			#hi_cnt clk = 0;
		end
	end
endmodule
