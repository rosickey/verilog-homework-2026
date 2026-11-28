// clk_gen_o.v
module clk_gen_o(zkb, zq, clk);
    input [7:0] zkb;
    input [7:0] zq;
    output reg clk;
    integer high;

    initial
    begin
        clk = 1'b0;
        forever
        begin
            high = zq * zkb / 100;
            #(zq - high) clk = 1'b1;
            #(high) clk = 1'b0;
        end
    end
endmodule
