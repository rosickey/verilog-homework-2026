`timescale 1ns / 1ns
module clk_gen(clk);
output clk;
reg clk;

parameter PERIOD = 20;  // 时钟周期20ns，对应50MHz

initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
end

endmodule