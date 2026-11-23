module top_tb;

reg clk;
reg reset;
reg inhibit;

wire [9:0] q;
wire cout;

// 例化CD4017
cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .cout(cout),
    .q(q)
);

led u0(.clk(q[0]),.out(led0));
led u1(.clk(q[1]),.out(led1));
led u2(.clk(q[2]),.out(led2));
led u3(.clk(q[3]),.out(led3));
led u4(.clk(q[4]),.out(led4));
led u5(.clk(q[5]),.out(led5));
led u6(.clk(q[6]),.out(led6));
led u7(.clk(q[7]),.out(led7));

// 时钟激励
initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

// reset 和 inhibit 激励
initial begin
    reset = 1'b1;
    inhibit = 1'b0;
    #10  reset = 1'b0;    // 释放复位，开始计数
    #120 inhibit = 1'b1;  // 拉高inhibit，禁止计数
    #80 $finish;
end

// 导出波形文件
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

endmodule