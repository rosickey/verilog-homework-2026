module clk_gen(clk_out, rst_n);
output clk_out;
input rst_n;
reg clk_out;
initial begin
    clk_out = 0;
end
always #10 clk_out = ~clk_out;
endmodule