module top_tb;
	wire clk;
	wire reset;
	wire inhibit;
	wire cout;
	wire [9:0] q;
	wire [7:0] led;

	clk_gen u_clk(clk,reset,inhibit);
	cd4017 u_cnt(clk,reset,inhibit,cout,q);
	led u0(q[0],led[0]);
	led u1(q[1],led[1]);
	led u2(q[2],led[2]);
	led u3(q[3],led[3]);
	led u4(q[4],led[4]);
	led u5(q[5],led[5]);
	led u6(q[6],led[6]);
	led u7(q[7],led[7]);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		#120 $finish;
	end
endmodule
