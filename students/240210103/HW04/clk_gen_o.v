module clk_gen_o(zkb, zq, clk);
	input [7:0] zkb;
	input [7:0] zq;
	output clk;
	reg clk;
	reg [7:0] cnt;

	always #1
	begin
		if(cnt < zkb)
			clk = 1;
		else
			clk = 0;

		if(cnt >= zq - 1)
			cnt = 0;
		else
			cnt = cnt + 1;
	end

	initial
	begin
		cnt = 0;
		clk = 0;
	end
endmodule