module top_tb;
	wire clk1;
	wire clk2;

	clk_gen_o #(20,50) u_clk1(clk1);
	clk_gen_o #(40,25) u_clk2(clk2);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		#200 $finish();
	end
endmodule
