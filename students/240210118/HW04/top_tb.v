module top_tb;
wire clk_50;        // 周期 20，占空比 50%
wire clk_25;        // 周期 20，占空比 25%（频率不变，只改占空比）
wire clk_75;        // 周期 20，占空比 75%
wire clk_slow;      // 周期 40，占空比 50%（占空比不变，只改频率）

// 频率由 PERIOD 决定，占空比由 DUTY 决定
clk_gen_o #(.PERIOD(20), .DUTY(50)) u_clk_50  (clk_50);
clk_gen_o #(.PERIOD(20), .DUTY(25)) u_clk_25  (clk_25);
clk_gen_o #(.PERIOD(20), .DUTY(75)) u_clk_75  (clk_75);
clk_gen_o #(.PERIOD(40), .DUTY(50)) u_clk_slow(clk_slow);

initial
begin
    $dumpfile("wave.vcd");          // 波形文件，GTKWave 打开
    $dumpvars();
    #200 $finish();                 // 200 结束
end
endmodule
