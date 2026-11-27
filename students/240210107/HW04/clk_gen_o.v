module clk_gen_o(zkb, zq, clk);
input [7:0] zkb; 
input [7:0] zq;  
output clk;
reg clk;
initial
begin
    clk = 0;
    forever begin
        #(zq*(100 - zkb)/100) clk = 1'b1;
        #(zq*zkb/100)         clk = 1'b0;
    end
end
endmodule