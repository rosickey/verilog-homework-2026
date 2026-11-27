module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire clk_tens;
	wire cout_units;
	wire cout_tens;
	wire[9:0] q_units;
	wire[9:0] q_tens;
	wire[3:0] unit_digit;
	wire[3:0] ten_digit;
	cd4017 u_units(clk,reset,inhibit,cout_units,q_units);
	assign clk_tens=~cout_units;
	cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);
	assign unit_digit=u_units.count;
	assign ten_digit=u_tens.count;

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		reset =1;
		inhibit =0;
		#25 reset =0;
		#2000 $finish();
	end
endmodule
