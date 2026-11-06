module test;
	reg clk;
	initial
	begin
		$dumpfile("done.vcd");
		$dumpvars("0,test");
		clk=0;
		#10 clk=~clk;
		#10 clk=~clk;
		#10 clk=~clk;
		#10 clk=~clk;
		#10 clk=~clk;
	end
endmodule