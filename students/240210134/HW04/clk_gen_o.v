module clk_gen_o(zkb, zq, clk);
    input [7:0] zkb;
    input [7:0] zq;
    output clk;
    reg clk;
    integer high;

    initial
    begin
        clk = 0;
        forever
        begin
            high = zkb;
            if (high < 1) high = 1;
            if (high > zq - 1) high = zq - 1;
            #(zq - high) clk = 1;
            #(high) clk = 0;
        end
    end
endmodule
