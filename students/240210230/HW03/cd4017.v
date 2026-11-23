`timescale 1ns/1ns
module cd4017(
    input clk,
    input rst,
    input ci,
    output reg [9:0] q,
    output carry_out
);

assign carry_out = (q[4]|q[5]|q[6]|q[7]|q[8]|q[9]) ? 1'b0 : 1'b1;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        q <= 10'b0000000001;
    end
    else if(ci == 1'b0) begin
        q <= {q[8:0], q[9]};
    end
end
endmodule
