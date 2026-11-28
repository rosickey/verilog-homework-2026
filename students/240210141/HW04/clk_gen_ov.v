`timescale 1ns/1ns
module clk_gen_ov(clk);
    parameter PERIOD = 20;
    parameter DUTY = 50;

    output reg clk;

    localparam HIGH_TIME = (PERIOD * DUTY) / 100;
    localparam LOW_TIME = PERIOD - HIGH_TIME;

    initial
    begin
        clk = 0;
        forever
        begin
            #LOW_TIME clk = 1;
            #HIGH_TIME clk = 0;
        end
    end
endmodule
