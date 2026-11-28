module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire clk_tens;
	wire cout_unit;
	wire cout_tens;
	wire [9:0] q_unit;
	wire [9:0] q_tens;
	wire [3:0] unit_digit;
	wire [3:0] tens_digit;

	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017_unit(clk,reset,inhibit,cout_unit,q_unit);
	cd4017 u_cd4017_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

	// 个位计到 9 时 cout_unit 为高，取反后产生十位的时钟上升沿，
	// 个位由 9 回到 0 的同一时刻十位加 1
	assign clk_tens = ~cout_unit;

	// 引出个位与十位的计数值，便于观察两位读数
	assign unit_digit = u_cd4017_unit.count;
	assign tens_digit = u_cd4017_tens.count;

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);

		reset = 1;
		inhibit = 0;
		#30 reset = 0;
		#370 inhibit = 1;
		#60 inhibit = 0;
		#50 $finish;
	end
endmodule
