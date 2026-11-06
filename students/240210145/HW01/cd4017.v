// cd4017.v
// 十进制计数器 CD4017 的行为级模型
//   clk : 计数时钟，上升沿有效
//   en  : 使能端，高电平允许计数，低电平保持当前输出
//   clr : 同步清零端，高电平时下一个上升沿回到 q[0]
//   q   : 十进制输出，任意时刻只有一位为 1
module cd4017(clk, en, clr, q);

    input        clk;
    input        en;
    input        clr;
    output reg [9:0] q;

    // 内部计数状态：0 ~ 9
    reg [3:0] cnt;

    // 计数逻辑：清零优先于使能，计到 9 后回卷到 0
    always @(posedge clk) begin
        if (clr) begin
            cnt <= 4'd0;
        end
        else if (en) begin
            if (cnt == 4'd9)
                cnt <= 4'd0;
            else
                cnt <= cnt + 4'd1;
        end
    end

    // 输出解码：把 0~9 的计数值翻译成十位独热码
    always @(*) begin
        q = 10'b0000000001 << cnt;
    end

endmodule
