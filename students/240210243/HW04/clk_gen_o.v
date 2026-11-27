module clk_gen_o(clk);
	output reg clk;
	parameter period=20;
	parameter high=10;

	initial
	begin
		clk=0;
		forever
		begin
			#high clk=1;
			#(period-high) clk=0;
		end
	end
endmodule
