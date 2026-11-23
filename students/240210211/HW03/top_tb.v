module test16;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout_1;
	wire[9:0] q1;
	wire [9:0] q10;
	clk_gen u_clk(clk);
	CD4017 u_q1(clk,reset,inhibit,cout_1,q1);
	 CD4017 u_q10(cout_1,reset,inhibit,,q10);
	initial
	begin
		$dumpfile("done");
		$dumpvars();
		reset=1;inhibit=1;
		#5 reset=0;
		#30 inhibit=0;
		#300 inhibit=1;
		#100 inhibit=0;
		#100 reset=0;
		#2000 $finish();
	end
endmodule
		

