module top_tb;
	wire clk;
	reg reset;
	wire cout_units;
	wire cout_tens;
	wire[9:0] q_units;
	wire[9:0] q_tens;

	clk_gen u_clk_gen(clk);
	cd4017 u_units(clk, reset, 1'b0, cout_units, q_units);
	cd4017 u_tens(clk, reset, ~cout_units, cout_tens, q_tens);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		reset = 1;
		#15 reset = 0;
		#2035 $finish;
	end
endmodule
