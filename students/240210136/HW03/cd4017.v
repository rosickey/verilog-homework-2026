`timescale 1ns / 1ns
module cd4017(clk, mr, q, co);
input clk;
input mr;
output [9:0] q;
output co;

reg [3:0] cnt;
reg [9:0] q;
reg co;

always @(posedge clk or posedge mr) begin
    if(mr) begin
        cnt <= 4'd0;
    end
    else begin
        if(cnt == 4'd9)
            cnt <= 4'd0;
        else
            cnt <= cnt + 4'd1;
    end
end

always @(*) begin
    case(cnt)
        4'd0: q = 10'b0000000001;
        4'd1: q = 10'b0000000010;
        4'd2: q = 10'b0000000100;
        4'd3: q = 10'b0000001000;
        4'd4: q = 10'b0000010000;
        4'd5: q = 10'b0000100000;
        4'd6: q = 10'b0001000000;
        4'd7: q = 10'b0010000000;
        4'd8: q = 10'b0100000000;
        4'd9: q = 10'b1000000000;
        default: q = 10'b0000000001;
    endcase
end

always @(*) begin
    co = (cnt <= 4'd4) ? 1'b1 : 1'b0;
end

endmodule
