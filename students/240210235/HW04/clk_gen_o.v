module clk_gen_o(zkb,zq,clk);
	input [7:0] zkb;
	input [7:0] zq;
	output clk;
	reg clk;
	integer high;
	integer low;
	
	initial
	begin
		clk=0;
		forever
		begin
			high=zq*zkb/100;
			low=zq-high;
			if(high<1)
				high=1;
			if(low<1)
				low=1;
			#(low) clk=1;
			#(high) clk=0;
		end
	end
endmodule