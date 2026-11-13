module clk_gen(rst_n,clk);
input rst_n;
output reg clk;
initial clk = 0;
always #10 clk=~clk;
endmodule