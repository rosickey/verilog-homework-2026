module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire cout_ones;
	wire cout_tens;
	wire[9:0] q_ones;
	wire[9:0] q_tens;
	wire tens_clk;

	assign tens_clk = ~cout_ones;

	cd4017 u_ones(clk,reset,inhibit,cout_ones,q_ones);
	cd4017 u_tens(tens_clk,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		reset =1;
		inhibit =0;
		#25 reset =0;
		#2100 $finish;
	end
endmodule
