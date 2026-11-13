module top;
     initial begin
         $dumpfile("wave.vcd");
         $dumpvars(0, top);
         #2000 $finish;
     end
     wire clk;
     reg reset;
     wire inhibit;
     wire cout;
     wire [9:0] q;
     wire out0,out1,out2,out3,out4,out5,out6,out7;
     clk_gen u_clk (clk);
     initial begin
         reset   = 1'b1;
         #55 reset = 1'b0;
     end
     assign inhibit = 1'b0;
     cd4017 u_cd4017 (
         clk,
         reset,
         inhibit,
         cout,
         q
     );
     led led0 ( q[0], out0 );
     led led1 ( q[1], out1 );
     led led2 ( q[2], out2 );
     led led3 ( q[3], out3 );
     led led4 ( q[4], out4 );
     led led5 ( q[5], out5 );
     led led6 ( q[6], out6 );
     led led7 ( q[7], out7 );
 endmodule