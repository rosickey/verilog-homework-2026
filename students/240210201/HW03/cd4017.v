    input clk,
    input rst,
    output reg [9:0] q,
    output carry
);
assign carry = q[9];

always @(posedge clk or posedge rst) begin
    if(rst) begin
        q <= 10'b0000000001;
    end
    else begin
        q <= {q[8:0], q[9]};
    end
end
endmodule
