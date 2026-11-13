`timescale 1ns / 1ps

module clk_gen (
    output reg clk
);
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
endmodule