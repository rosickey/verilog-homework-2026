`timescale 1ns/1ps

//top_tb.v
module top_tb;
    wire clk;
    reg  reset;
    wire inhibit;
    wire cout;
    wire [9:0] q;
    wire [7:0] led;

    // 实例化方波激励模块
    clk_gen u_clk_gen(
        .clk(clk)
    );

    // 实例化一个 cd4017
    cd4017 u_cd4017(
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .cout(cout),
        .q(q)
    );

    // 实例化八个 led
    led u_led0(.clk(q[0]), .out(led[0]));
    led u_led1(.clk(q[1]), .out(led[1]));
    led u_led2(.clk(q[2]), .out(led[2]));
    led u_led3(.clk(q[3]), .out(led[3]));
    led u_led4(.clk(q[4]), .out(led[4]));
    led u_led5(.clk(q[5]), .out(led[5]));
    led u_led6(.clk(q[6]), .out(led[6]));
    led u_led7(.clk(q[7]), .out(led[7]));

    // 禁止信号：低电平允许计数
    assign inhibit = 1'b0;

    // 上电复位：先复位一段时间，再释放
    initial begin
        reset = 1'b1;
        #12;
        reset = 1'b0;
    end

    // 生成 VCD 波形文件
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        #200;
        $finish;
    end
endmodule
