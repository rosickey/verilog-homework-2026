module top_tb;
wire clk;
wire [9:0] q1;
wire [9:0] q10;
wire cout_1;
reg reset;
reg inhibit;
clk_gen u_clk(clk);
cd4017 u_q1(clk, reset, inhibit,cout_1, q1);
cd4017 u_q10( cout_1, reset, inhibit, ,q10);
initial
begin
    reset = 1'b1;
    inhibit = 1'b0;
    #10 reset = 1'b0;
    #2000 $finish;
end

initial
begin
    $dumpfile("report");
    $dumpvars();
end
endmodule