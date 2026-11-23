`timescale 1ns/1ps

module top_tb;

wire clk;
reg reset;
reg inhibit;
wire cout_ones;
wire cout_tens;
wire [9:0] q_ones;
wire [9:0] q_tens;

clk_gen u_clk_gen(clk);

cd4017 u_ones(clk, reset, inhibit, cout_ones, q_ones);
cd4017 u_tens(~q_ones[9], reset, inhibit, cout_tens, q_tens);

initial
begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);

    reset   = 1'b1;
    inhibit = 1'b0;

    #25  reset = 1'b0;
    #165 ;

    inhibit = 1'b1;
    #20 ;

    inhibit = 1'b0;
    #220 ;

    $finish;
end

initial
$monitor("time=%0t tens=%0d ones=%0d", $time, u_tens.count, u_ones.count);

endmodule
