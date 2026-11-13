module test_clk;
	wire clk;
	reg en,clr;
	wire[9:0] q;
	clk_gen u_clk(clk);
	CD4017 u_cd4017(clk,en,clr,q);
	initial
	begin
		$dumpfile("clk");
		$dumpvars();
		en=0;clr=1;
		#5 en=1;
		#30 clr=0;
		#300 clr=1;
		#100 clr=0;
		#100 en=0;
		#200 $finish();
	end
endmodule