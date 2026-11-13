// top_tb.v
`timescale 1ns/1ns

module top_tb;
    wire clk;
    reg reset;
    wire inhibit;
    wire cout;
    wire [9:0] q;
    wire [7:0] led_out;

    // 实例化激励信号模块（方波时钟）
    clk_gen u_clk_gen(
        .clk(clk)
    );

    // 产生复位信号：初始为高，20ns后拉低
    initial begin
        reset = 1'b1;
        #20 reset = 1'b0;
    end

    // 禁止计数端接0，允许一直计数
    assign inhibit = 1'b0;

    // 实例化一个cd4017计数器
    cd4017 u_cd4017(
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .cout(cout),
        .q(q)
    );

    // 实例化八个led，分别连接q[0]~q[7]
    led u_led0(.clk(q[0]), .out(led_out[0]));
    led u_led1(.clk(q[1]), .out(led_out[1]));
    led u_led2(.clk(q[2]), .out(led_out[2]));
    led u_led3(.clk(q[3]), .out(led_out[3]));
    led u_led4(.clk(q[4]), .out(led_out[4]));
    led u_led5(.clk(q[5]), .out(led_out[5]));
    led u_led6(.clk(q[6]), .out(led_out[6]));
    led u_led7(.clk(q[7]), .out(led_out[7]));

    // 生成VCD波形文件
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

    // 仿真结束时间
    initial begin
        #200 $finish;
    end
endmodule
