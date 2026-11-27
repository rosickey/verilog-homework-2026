module top_tb;
	reg[7:0] zkb1;
	reg[7:0] zq1;
	wire clk1;
	clk_gen_o u_clk1(zkb1,zq1,clk1);
	reg[7:0] zkb2;
	reg[7:0] zq2;
	wire clk2;
	clk_gen_o u_clk2(zkb2,zq2,clk2);
	
	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		zkb1 = 50;
		zq1 = 40;
		zkb2 = 20;
		zq2 = 100;
		#420 zkb1 = 25;
		zq1 = 80;
		#180 zkb2 = 75;
		zq2 = 60;
		#400 $finish();
	end

endmodule
