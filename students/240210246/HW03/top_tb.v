module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire cout1;
	wire cout2;
	wire[9:0] q1;
	wire[9:0] q2;
	wire clk2;
	cd4017 u_ones(clk,reset,inhibit,cout1,q1);
	assign clk2 = ~cout1;
	cd4017 u_tens(clk2,reset,inhibit,cout2,q2);
	
	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#2075 $finish();
	end

endmodule
