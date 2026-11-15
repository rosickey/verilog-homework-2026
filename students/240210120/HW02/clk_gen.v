module clk_gen(
    output reg clk
);
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
endmodule