module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire cout;
	wire[9:0] q;
	wire[7:0] led_out;
	cd4017 u_cd4017(clk,reset,inhibit,cout,q);

	led u0(q[0],led_out[0]);
	led u1(q[1],led_out[1]);
	led u2(q[2],led_out[2]);
	led u3(q[3],led_out[3]);
	led u4(q[4],led_out[4]);
	led u5(q[5],led_out[5]);
	led u6(q[6],led_out[6]);
	led u7(q[7],led_out[7]);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars;
		reset = 1;
		inhibit = 0;
		#25 reset = 0;
		#200 inhibit = 1;
		#70 inhibit = 0;
		#100 $finish;
	end
endmodule
