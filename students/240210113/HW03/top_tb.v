module top_tb;
wire clk;
wire cout_low;
wire [9:0] q_low;
wire [9:0] q_high;
reg reset;
reg inhibit;

clk_gen u1(.clk(clk));
cd4017 u_low(.clk(clk),.reset(reset),.inhibit(inhibit),.cout(cout_low),.q(q_low));
cd4017 u_high(.clk(~q_low[9]),.reset(reset),.inhibit(inhibit),.q(q_high));

initial begin
reset = 1'b1;
inhibit = 1'b0;
#12 reset = 1'b0;
#240 inhibit = 1'b1;
#160 inhibit = 1'b0;
#300 reset = 1'b1;
#40 reset = 1'b0;
#350 $finish;
end

initial begin
$dumpfile("report.vcd");
$dumpvars(0,top_tb);
end
endmodule