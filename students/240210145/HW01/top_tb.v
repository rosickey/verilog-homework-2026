// top_tb.v
// CD4017 十进制计数器仿真测试平台
// 激励由 clk_gen 产生（周期 20ns），依次测试：上电清零 -> 正常计数 -> 同步清零 -> 使能保持
// 时间单位沿用仿真工具的默认值（Vivado / ModelSim 默认 1ns），与课堂 clk_gen.v 保持一致

module top_tb;

    wire       clk;
    reg        en;
    reg        clr;
    wire [9:0] q;

    // 课堂订正后的时钟激励模块
    clk_gen u_clk_gen (
        .clk(clk)
    );

    // 被测的 CD4017
    cd4017 u_cd4017 (
        .clk(clk),
        .en (en),
        .clr(clr),
        .q  (q)
    );

    // 波形文件，供 GTKWave 等工具查看
    initial begin
        $dumpfile("cd4017_tb.vcd");
        $dumpvars(0, top_tb);
    end

    // 激励序列
    initial begin
        clr = 1'b1;
        en  = 1'b0;
        #20 clr = 1'b0;        // 释放清零
        #20 en  = 1'b1;        // 打开使能，开始十进制计数
        #200 clr = 1'b1;       // 计数一轮后给同步清零
        #20 clr = 1'b0;
        #200 en  = 1'b0;       // 关使能，检查输出保持不变
        #60 en  = 1'b1;        // 恢复计数
        #100 $finish;
    end

    // 逐拍打印，便于在控制台核对
    always @(posedge clk) begin
        #1 $display("time=%0t clr=%b en=%b q=%b", $time, clr, en, q);
    end

endmodule
