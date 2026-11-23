module top_tb;
	wire clk;
	reg reset;
	wire [9:0] q_ones;
	wire [9:0] q_tens;
	wire cout_ones;
	wire cout_tens;

	clk_gen u_clk(clk);

	cd4017 u_ones(clk, reset, 1'b0, cout_ones, q_ones);
	cd4017 u_tens(~cout_ones, reset, 1'b0, cout_tens, q_tens);

	initial
	begin
		reset = 0;
		#5 reset = 1;
		#20 reset = 0;
		#2200 $finish;
	end

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);
	end
endmodule
