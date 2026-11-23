`timescale 1ns/1ps
//led.v
module led(clk,out);
    input clk;
    output out;
    assign out = clk;
endmodule
