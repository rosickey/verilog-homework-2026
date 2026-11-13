module top(rst,led_out);
input rst;
output[7:0] led_out;
wire clk;
wire [9:0] q;
wire cout;
clk_gen u_clk(~rst,clk);
cd4017 u_d4017(clk,rst,1'b0,cout,q);
led u_led0(q[0],led_out[0]);
led u_led1(q[1],led_out[1]);
led u_led2(q[2],led_out[2]);
led u_led3(q[3],led_out[3]);
led u_led4(q[4],led_out[4]);
led u_led5(q[5],led_out[5]);
led u_led6(q[6],led_out[6]);
led u_led7(q[7],led_out[7]);
endmodule
module top_tb;
reg rst;
wire [7:0] led_out;
top uut(rst,led_out);
initial begin
rst=1;
#20 rst=0;
#200 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,top_tb);
end
endmodule