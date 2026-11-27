`timescale 1ns / 1ns
module clk_gen_o(clk, rst_n, clk_out);
input  clk;        // 系统时钟
input  rst_n;      // 异步复位，低电平有效
output clk_out;    // 输出方波

parameter CLK_FREQ   = 50_000_000;  // 输入时钟频率，单位Hz
parameter OUT_FREQ   = 1_000_000;   // 输出方波频率，单位Hz
parameter DUTY_CYCLE = 50;          // 输出占空比，单位%

localparam CNT_TOTAL = CLK_FREQ / OUT_FREQ;           // 一个输出周期的计数总数
localparam CNT_HIGH  = CNT_TOTAL * DUTY_CYCLE / 100;  // 高电平计数个数

reg [31:0] cnt;
reg        clk_out;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cnt <= 32'd0;
        clk_out <= 1'b0;
    end
    else if(cnt == CNT_TOTAL - 1'b1) begin
        cnt <= 32'd0;
        clk_out <= 1'b1;
    end
    else begin
        cnt <= cnt + 1'b1;
        if(cnt == CNT_HIGH - 1'b1)
            clk_out <= 1'b0;
    end
end

endmodule
