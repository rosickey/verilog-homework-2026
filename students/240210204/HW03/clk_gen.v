module clk_gen(clk_in, clk_out);
	input clk_in;
	output reg clk_out;
	reg [3:0] cnt;
	initial begin
		cnt = 4'd0;
		clk_out  = 1'b0;
	end
		always @(posedge clk_in) begin
		cnt <=cnt + 1'b1;
		if(cnt ==4'd9) begin
		cnt<=4'd0;
		clk_out <= ~clk_out;
		end
	end
endmodule
