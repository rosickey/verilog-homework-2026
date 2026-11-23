// HW03 两位十进制计数器：方波激励 + 两个 CD4017（个位、十位）
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_ones;
	wire cout_tens;
	wire clk_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;

	clk_gen u_clk_gen (
		.clk(clk)
	);

	cd4017 u_ones (
		.clk(clk),
		.reset(reset),
		.inhibit(inhibit),
		.cout(cout_ones),
		.q(q_ones)
	);

	// 个位 9 变 0 时 cout_ones 由高变低，取反后作为十位的计数脉冲
	assign clk_tens = ~cout_ones;

	cd4017 u_tens (
		.clk(clk_tens),
		.reset(reset),
		.inhibit(inhibit),
		.cout(cout_tens),
		.q(q_tens)
	);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);

		reset = 1;
		inhibit = 0;
		#25 reset = 0;

		#1990 inhibit = 1;
		#200 inhibit = 0;
		#105 $finish;
	end
endmodule
