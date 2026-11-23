module top_tb;
wire clk;
wire [9:0] q0;
wire [9:0] q1;
wire carry0;

clk_gen u_clk(
    .clk(clk)
);

cd4017 u0(
    .clk(clk),
    .rst(1'b0),
    .q(q0),
    .carry(carry0)
);

cd4017 u1(
    .clk(carry0),
    .rst(1'b0),
    .q(q1)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    #200 $finish;
end
endmodule
