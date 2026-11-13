module clk_gen(
    output reg clk,
    output reg reset
);

initial begin
    clk = 0;
    reset = 1;
    #20 reset = 0;
end

always #5 clk = ~clk;

endmodule
