module top_tb;
	wire clk1,clk2;

	clk_gen_o u1(8'd50,8'd100,clk1);
	clk_gen_o u2(8'd20,8'd50,clk2);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		#1000 $finish;
	end
endmodule
