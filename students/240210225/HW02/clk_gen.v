module clk_gen(clk,reset,inhibit);
	output clk,reset,inhibit;
	reg clk,reset,inhibit;

	initial
	begin
		clk=1'b0;
		reset=1'b1;
		inhibit=1'b0;
		#20 reset=1'b0;
	end

	always #5 clk=~clk;
endmodule
