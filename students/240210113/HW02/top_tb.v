module top_tb;
wire clk;
wire [9:0] q;
wire cout;
wire led0,led1,led2,led3,led4,led5,led6,led7;

clk_gen u_clk(.clk(clk));

cd4017 u_cd4017(
    .clk(clk),
    .reset(1'b0),
    .inhibit(1'b0),
    .cout(cout),
    .q(q)
);

led u0(.clk(q[0]),.out(led0));
led u1(.clk(q[1]),.out(led1));
led u2(.clk(q[2]),.out(led2));
led u3(.clk(q[3]),.out(led3));
led u4(.clk(q[4]),.out(led4));
led u5(.clk(q[5]),.out(led5));
led u6(.clk(q[6]),.out(led6));
led u7(.clk(q[7]),.out(led7));

initial begin
    #200 $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
end
endmodule