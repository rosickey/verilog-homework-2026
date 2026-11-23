module top_tb;
	wire clk;
	wire clk_t;
	wire cout_u, cout_t;
	wire [9:0] q_u, q_t;
	reg reset, inhibit;

	clk_gen u_clk(clk);
	cd4017 u_units(clk, reset, inhibit, cout_u, q_u);
	assign clk_t = ~cout_u;
	cd4017 u_tens(clk_t, reset, inhibit, cout_t, q_t);

	initial
	begin
		$dumpfile("done");
		$dumpvars();
		reset = 1;
		inhibit = 0;
		#15 reset = 0;
		#2000 $finish;
	end
endmodule
