module clk_gen_o(clk);
	parameter PERIOD=20;
	parameter DUTY=50;
	output reg clk;

	initial
	begin
		clk=1;
		forever
		begin
			#(PERIOD*DUTY/100) clk=0;
			#(PERIOD*(100-DUTY)/100) clk=1;
		end
	end
endmodule
