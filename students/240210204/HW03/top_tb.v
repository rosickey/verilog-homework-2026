module top_tb;
	reg clk_in;
	reg rst_n;
	wire clk;
	wire reset;
	wire inhibit;
	wire cout0;
	wire [9:0] q0;
	wire cout1;
	wire [9:0] q10;
	assign reset = ~rst_n;
	assign inhibit = 1'b0;
	clk_gen u_clk_gen(
	clk_in,
	clk
	);
	cd4017 u_cd4017_ge(
	clk,
	reset,
	1'b0,
	cout0,
	q0
	);
	cd4017 u_cd4017_shi(
	clk,
	reset,
	cout0,
	cout1,
	q10
	);
		initial begin
		clk_in = 0;
		rst_n=0;
		#20 rst_n=1;
	end
		always #10 clk_in = ~clk_in;
	initial begin
		$dumpfile("picture.vcd");
		$dumpvars();
		#2000;
		$finish;
	end
endmodule