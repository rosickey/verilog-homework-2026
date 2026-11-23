module tb;
reg clk,reset,inhibit;
wire [9:0] q_ge;  
wire [9:0] q_shi; 
wire co_ge;    


cd4017 u_ge(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .cout(co_ge),
    .q(q_ge)
);


cd4017 u_shi(
    .clk(!co_ge),
    .reset(reset),
    .inhibit(inhibit),
    .q(q_shi)
);


initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    clk=0; reset=1; inhibit=0;
    #20 reset=0;
    #2500 $finish;
end
always #10 clk = ~clk;
endmodule
