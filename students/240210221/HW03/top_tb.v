module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_ones;
	wire cout_tens;
	wire clk_tens;
	wire [9:0] q_ones;
	wire [9:0] q_tens;

	assign clk_tens = ~cout_ones;

	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017_ones(clk,reset,inhibit,cout_ones,q_ones);
	cd4017 u_cd4017_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		reset=1'b1;
		inhibit=1'b0;
		#40 reset=1'b0;
		#2000 $finish;
	end
endmodule
