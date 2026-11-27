module clk_gen_o(zkb, zq, clk);
input [7:0] zkb;    // duty cycle in percent (0~100)
input [7:0] zq;     // period in time units
output clk;
reg clk;
integer high;

initial
begin
    clk = 0;
end

always
begin
    high = zq * zkb / 100;
    if (clk == 1'b0)
        #(zq - high) clk = 1'b1;
    else
        #(high) clk = 1'b0;
end
endmodule
