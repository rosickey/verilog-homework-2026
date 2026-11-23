module test;
reg clk;
reg reset;
wire [9:0] q0;
wire [9:0] q1;
wire carry;

assign carry = q0[9];

cd4017 u0(clk, reset, 1'b0, , q0);
cd4017 u1(clk, reset, ~carry, , q1);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    reset = 1;
    #20;
    reset = 0;
    #2000;
    $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
end

endmodule