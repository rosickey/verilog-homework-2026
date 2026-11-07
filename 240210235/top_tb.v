module test16;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	wire[3:0] out;
	count_16 u_count(clk,reset,out);
	
	initial
	begin
		$dumpfile("done");
		$dumpvars();
		reset = 1;
		#30 reset = 0;
		#360 reset = 1;
		#400 $finish();
	end
	
endmodule