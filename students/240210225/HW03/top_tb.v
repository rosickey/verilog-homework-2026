module top_tb;
	wire clk;
	wire reset;
	wire inhibit;
	wire cout_ones;
	wire cout_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;

	clk_gen u_clk(clk,reset,inhibit);
	cd4017 u_ones(clk,reset,inhibit,cout_ones,q_ones);
	cd4017 u_tens(cout_ones,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		#10000 $finish;
	end
endmodule
