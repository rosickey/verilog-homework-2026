module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire cout_units;
	wire cout_tens;
	wire[9:0] q_units;
	wire[9:0] q_tens;
	wire units_clk;
	cd4017 u_units(clk,reset,inhibit,cout_units,q_units);
	assign units_clk = ~cout_units;
	cd4017 u_tens(units_clk,reset,inhibit,cout_tens,q_tens);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars;
		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#495 $finish;
	end
endmodule
