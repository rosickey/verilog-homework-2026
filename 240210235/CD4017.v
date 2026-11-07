module count_16(clk,reset,out);
		input clk, reset;		
		output reg [3:0] out ;		
				
		always@(posedge clk)	
		begin
			if(reset)			
				out <= 4'b0000;	
			else if(out == 4'd9)
				out <= 4'b0000;
			else
				out <= out +1'b1;
		end
endmodule