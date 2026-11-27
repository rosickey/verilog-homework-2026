module clk_gen(clk,zkb,zq);
	input[7:0] zkb;
	input[7:0] zq;
	output  clk;
	reg clk;
	parameter UNIT=2;
	real period;
	real high;
	initial
	begin
		clk=0;
		forever 
		begin
			period=zq*UNIT;
			high=period*(zkb/100.0);
			clk=1;
			#(high);
			clk=0;
			#(period-high);
		end
	end
endmodule