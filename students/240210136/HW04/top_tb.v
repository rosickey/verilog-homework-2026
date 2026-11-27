`timescale 1ns / 1ns
module top_tb;

reg  sys_clk;
reg  sys_rst_n;
wire clk_out1;    // 第一路输出：1MHz，占空比50%
wire clk_out2;    // 第二路输出：500kHz，占空比30%

// 第一路：50MHz输入，1MHz输出，占空比50%
clk_gen_o #(
    .CLK_FREQ   (50_000_000),
    .OUT_FREQ   (1_000_000),
    .DUTY_CYCLE (50)
) u_clk_gen_1 (
    .clk     (sys_clk),
    .rst_n   (sys_rst_n),
    .clk_out (clk_out1)
);

// 第二路：50MHz输入，500kHz输出，占空比30%
clk_gen_o #(
    .CLK_FREQ   (50_000_000),
    .OUT_FREQ   (500_000),
    .DUTY_CYCLE (30)
) u_clk_gen_2 (
    .clk     (sys_clk),
    .rst_n   (sys_rst_n),
    .clk_out (clk_out2)
);

// 生成50MHz系统时钟，周期20ns
initial begin
    sys_clk = 1'b0;
    forever #10 sys_clk = ~sys_clk;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);

    sys_rst_n = 1'b0;
    #50;
    sys_rst_n = 1'b1;

    #6000;
    $finish;
end

endmodule
