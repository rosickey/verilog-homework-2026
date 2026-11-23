module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	wire cout_units;
	wire cout_tens;
	wire[9:0] q_units;
	wire[9:0] q_tens;
	cd4017 u_units(clk, reset, 1'b0, cout_units, q_units);
	cd4017 u_tens(clk, reset, !cout_units, cout_tens, q_tens);

	initial
	begin
		$dumpfile("report");
		$dumpvars(0, top_tb);
		reset = 1;
		#25 reset = 0;
		#2075 $finish();
	end
endmodule
