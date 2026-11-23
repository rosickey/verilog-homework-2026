// HW02 流水灯：实例化 1 个 cd4017 与 8 个 led
module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire [9:0] q;
	wire cout;
	wire [7:0] light;

	clk_gen u_clk_gen (
		.clk(clk)
	);

	cd4017 u_cd4017 (
		.clk(clk),
		.reset(reset),
		.inhibit(inhibit),
		.cout(cout),
		.q(q)
	);

	led u_led0(.clk(q[0]),.out(light[0]));
	led u_led1(.clk(q[1]),.out(light[1]));
	led u_led2(.clk(q[2]),.out(light[2]));
	led u_led3(.clk(q[3]),.out(light[3]));
	led u_led4(.clk(q[4]),.out(light[4]));
	led u_led5(.clk(q[5]),.out(light[5]));
	led u_led6(.clk(q[6]),.out(light[6]));
	led u_led7(.clk(q[7]),.out(light[7]));

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		reset = 1;
		inhibit = 0;
		#25 reset = 0;

		#275 inhibit = 1;
		#100 inhibit = 0;

		#160 $finish;
	end
endmodule
