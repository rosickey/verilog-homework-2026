module clk_gen_o (zkb, zq, clk);
 input [7:0] zkb;   
 input [7:0] zq;   
 output clk;
 reg clk;
 initial
 begin
     clk = 0;
     forever begin
         # zq  clk = 1;
         # zkb clk = 0;
     end
 end
 endmodule