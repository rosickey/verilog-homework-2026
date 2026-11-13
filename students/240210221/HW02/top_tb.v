module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire cout;
	wire [9:0] q;
	wire [7:0] led;

	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017(clk,reset,inhibit,cout,q);
	led u_led0(q[0],led[0]);
	led u_led1(q[1],led[1]);
	led u_led2(q[2],led[2]);
	led u_led3(q[3],led[3]);
	led u_led4(q[4],led[4]);
	led u_led5(q[5],led[5]);
	led u_led6(q[6],led[6]);
	led u_led7(q[7],led[7]);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		reset=1'b1;
		inhibit=1'b0;
		#40 reset=1'b0;
		#460 $finish;
	end
endmodule
