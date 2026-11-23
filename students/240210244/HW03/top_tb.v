module top_tb;
 wire clk;
 reg reset;
 reg inhibit;
 wire clk_tens;
 wire cout_unit;
 wire cout_tens;
 wire [9:0] q_unit;
 wire [9:0] q_tens;
 clk_gen u_clk(clk);
 cd4017 u_cd4017_unit(clk,reset,inhibit,cout_unit,q_unit);
 cd4017 u_cd4017_tens(clk_tens,reset,inhibit,cout_tens,q_tens);
 assign clk_tens = ~cout_unit;
 initial
 begin
     $dumpfile("top_tb.vcd");
     $dumpvars();
     reset = 1;
     inhibit = 0;
     #25 reset = 0;
     #980 inhibit = 1;
     #100 inhibit = 0;
     #1020 $finish;
 end
 endmodule