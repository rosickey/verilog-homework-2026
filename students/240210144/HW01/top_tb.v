module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg en;
	reg clr;
	wire[9:0] q;
	CD4017 u_cd4017(clk, en, clr, q);

	initial
	begin
		$dumpfile("report");
		$dumpvars();
		clr = 1;
		en = 1;
		#25 clr = 0;
		#400 en = 0;
		#100 en = 1;
		#100 clr = 1;
		#50 clr = 0;
		#125 $finish();
	end
endmodule