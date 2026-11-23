module top_tb;
wire clk;
reg reset;

wire cout_low;
wire [9:0] q_low;
wire cout_high;
wire [9:0] q_high;

clk_gen u_clk(clk);
cd4017 u_low (clk, reset, 1'b0, cout_low, q_low);
cd4017 u_high (cout_low, reset, 1'b0, cout_high, q_high);

initial
begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);
    reset = 1;
    #25 reset = 0;
    #2000 $finish;
end

endmodule
