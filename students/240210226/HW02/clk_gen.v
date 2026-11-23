`timescale 1ns / 1ns

module clk_gen #(parameter HALF_PERIOD = 10) (output reg clk);

    initial clk = 1'b0;

    always #HALF_PERIOD clk = ~clk;

endmodule
