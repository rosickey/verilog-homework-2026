module top_tb;
wire clk;
wire [9:0] q;
wire cout;
reg reset;
reg inhibit;

clk_gen u_clk (.clk(clk));

cd4017 u_cd4017 (
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .cout(cout),
    .q(q)
);

led led0 (.clk(q[0]));
led led1 (.clk(q[1]));
led led2 (.clk(q[2]));
led led3 (.clk(q[3]));
led led4 (.clk(q[4]));
led led5 (.clk(q[5]));
led led6 (.clk(q[6]));
led led7 (.clk(q[7]));

initial begin
    reset = 1'b1;
    inhibit = 1'b0;
    #10 reset = 1'b0;
    #200 $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
end
endmodule
