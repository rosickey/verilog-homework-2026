module cd4017(
    input clk,
    input reset,
    input inhibit,
    output cout,
    output reg [9:0] q
);
reg [3:0] count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'd0;
    end
    else if (!inhibit) begin
        if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end
end

always(*) begin
    q = 10'b0000000001 << count;
end

assign cout = (count == 4'd9);
endmodule
