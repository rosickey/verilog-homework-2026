module clk_gen(clk);
output reg clk;
initial begin
clk = 1'b0;
end
always #6 clk = ~clk;
endmodule