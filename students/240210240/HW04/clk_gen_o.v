module clk_gen_o(zkb, zq, clk);
		input [7:0] zkb;			
		input [7:0] zq;		
		output clk;
		reg clk;
		integer high;

		initial
		begin
			clk = 0;
		end

		always
		begin
			high = zq * zkb / 100;
			if (clk == 1'b0)
				#(zq - high) clk = 1'b1;
			else
				#(high) clk = 1'b0;
		end
endmodule