module cd4017(
    input        clk,
    input        reset,
    input        inhibit,
    output       cout,
    output [9:0] q
);

reg [3:0] count = 4'd0;

always @(posedge clk) begin
    if (reset || count == 4'd9) begin
        count <= 4'd0;
    end
    else if (inhibit) begin
        count <= count;
    end
    else begin
        count <= count + 4'd1;
    end
end

assign q = 10'b0000000001 << count;
assign cout = ~(count == 4'd9);

endmodule
