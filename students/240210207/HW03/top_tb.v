module top_tb;
	wire clk;
	wire [9:0] q0;
	wire [9:0] q1;
	wire cout0;
	wire cout1;
	wire led0,led1,led2,led3,led4,led5,led6,led7;
	reg reset;
	reg inhibit;
	clk_gen u_clk(clk);
	cd4017 u_cd4017_0(clk,reset,inhibit,cout0,q0);
	cd4017 u_cd4017_1(clk,reset,inhibit,cout1,q1);
	initial
	begin
		reset = 1'b1;
		inhibit = 1'b0;
		#10 reset = 1'b0;
		#2000 $finish;
	end
	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars;
	end
endmodule