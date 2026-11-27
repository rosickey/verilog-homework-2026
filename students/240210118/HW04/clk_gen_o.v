module clk_gen_o(clk);
parameter PERIOD = 20;                  // 周期，决定频率 f = 1/PERIOD
parameter DUTY   = 50;                  // 高电平占一个周期的百分比，决定占空比
output reg clk;

localparam HIGH = PERIOD * DUTY / 100;  // 高电平持续时间
localparam LOW  = PERIOD - HIGH;        // 低电平持续时间

initial begin
    clk = 0;
    forever begin
        #LOW  clk = 1;                  // 低电平维持 LOW
        #HIGH clk = 0;                  // 高电平维持 HIGH
    end
end
endmodule
