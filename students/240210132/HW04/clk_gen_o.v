`timescale 1ns/1ps

module clk_gen_o(zkb, zq, clk);
        input  [7:0] zkb;
        input  [7:0] zq;
        output reg   clk;
        integer high;

        initial
        begin
                clk = 1'b0;
                forever
                begin
                        high = zq * zkb / 100;

                        if (high > zq)
                                high = zq;
                        else if (high < 0)
                                high = 0;

                        #(zq - high) clk = 1'b1;
                        #high        clk = 1'b0;
                end
        end
endmodule
