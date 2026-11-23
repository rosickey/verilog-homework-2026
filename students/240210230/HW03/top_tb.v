`timescale 1ns/1ns
module top_tb;
wire clk;
reg rst;

wire [9:0] q0;    
wire [9:0] q1;   
wire carry0;     

clk_gen u_clk(
    .clk(clk)
);

cd4017 u_low(
    .clk(clk),
    .rst(rst),
    .ci(1'b0),
    .q(q0),
    .carry_out(carry0)
);


cd4017 u_high(
    .clk(carry0),
    .rst(rst),
    .ci(1'b0),
    .q(q1)
);
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
    rst = 1'b1;
    #20;
    rst = 1'b0;
    #2000; 
    $finish;
end
endmodule
