module top;
reg clk, reset, inhibit;
wire [9:0] q0;   
wire [9:0] q1;   
wire cout0, cout1;

cd4017 u0(clk, reset, inhibit, cout0, q0); 
cd4017 u1(cout0, reset, inhibit, cout1, q1);

initial begin
    $dumpfile("done.vcd");
    $dumpvars;
    clk = 0;
    reset = 1;
    inhibit = 0;
    #20 reset = 0;
    #2000 $finish;
end

always #10 clk = ~clk;

endmodule
