module clk_gen(clk_in, clk_out);
	input clk_in;
	input [7:0] period_set;
	input [7:0] high_set;
	output reg clk_out;
	reg [7:0] cnt;
	initial begin
		cnt = 8'd0;
		clk_out  = 1'b0;
	end
	always @(posedge clk_in) begin
		if (cnt >= period_set -1'b1) begin
			cnt <= 8'd0;
	else begin
			cnt <= cnt + 1'b1;
	end
	if (cnt <high_set) begin
		clk_out <= 1'b1;
	end
	else begin
		clk_out <= 1'b0;
	end
	end
endmodule
