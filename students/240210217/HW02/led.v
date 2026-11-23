// led.v
// 发光二极管模块：输出直接跟随输入电平
`timescale 1ns/1ps

module led(clk,out);
    input clk;
    output out;
    assign out = clk;
endmodule
