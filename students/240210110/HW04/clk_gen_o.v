module clk_gen_o(zkb,zq,clk);
input [7:0] zkb;  
input [7:0] zq;   
output clk;
reg clk;

reg [15:0] t_high;
reg [15:0] t_low;

initial begin
    clk = 1'b0;
    forever begin
        t_high = zq * zkb / 100;
        t_low  = zq - t_high;
        #t_low;
        clk = 1'b1;
        #t_high;
        clk = 1'b0;
    end
end
endmodule