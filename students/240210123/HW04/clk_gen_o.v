`timescale 1ns / 1ns

module clk_gen_o(zkb, zq, clk);
input  [7:0] zkb;
input  [7:0] zq;
output clk;
reg    clk;

integer t_high;
integer t_low;

initial
begin
    clk = 0;
    #1;
    forever
    begin
        t_high = zq * zkb / 100;
        t_low  = zq - t_high;
        if (t_high < 1) t_high = 1;
        if (t_low  < 1) t_low  = 1;
        if (clk == 1'b0)
            #t_low  clk = 1'b1;
        else
            #t_high clk = 1'b0;
    end
end

endmodule
