// led.v
// 教师提供的 LED 模块，这里作为输出缓冲使用
module led(clk,out);
    input clk;
    output out;
    assign out = clk;
endmodule
