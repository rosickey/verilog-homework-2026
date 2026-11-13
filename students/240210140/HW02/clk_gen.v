`timescale 1ns/1ps
//clk_gen.v
module clk_gen(clk);
    output clk;
    reg clk;

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
endmodule
