module top_tb;

wire clk;
reg reset;
reg inhibit;
wire cout;
wire [9:0] q;

wire led0_out;
wire led1_out;
wire led2_out;
wire led3_out;
wire led4_out;
wire led5_out;
wire led6_out;
wire led7_out;

clk_gen u_clk_gen (clk);
cd4017  u_cd4017  (clk, reset, inhibit, cout, q);

led led0 (q[0], led0_out);
led led1 (q[1], led1_out);
led led2 (q[2], led2_out);
led led3 (q[3], led3_out);
led led4 (q[4], led4_out);
led led5 (q[5], led5_out);
led led6 (q[6], led6_out);
led led7 (q[7], led7_out);

initial begin
    reset   = 1'b1;
    inhibit = 1'b1;
    #20;
    reset   = 1'b0;
    inhibit = 1'b0;
    #300;
    $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    $monitor("time=%0t q7~q0 = %b", $time, q[7:0]);
end

endmodule