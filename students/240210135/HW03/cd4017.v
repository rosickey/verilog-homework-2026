module CD4017(
    input        clk,
    input        en,
    input        clr,
    output reg [9:0] q,
    output       co
);

// 进位：走到最后一个状态时拉高，用于驱动高位
assign co = (q == 10'b1000000000);

always @(posedge clk) begin
    if (clr == 1'b1) begin
        q <= 10'b0000000001; // CD4017 默认 Q0 有效
    end
    else if (en == 1'b1) begin
        if (q == 10'b1000000000) begin
            q <= 10'b0000000001;
        end
        else begin
            q <= q << 1'b1;
        end
    end
end

endmodule