module top_tb;
wire clk;
reg reset;
reg inhibit;
wire cout;
wire [9:0] q;
wire led0,led1,led2,led3,led4,led5,led6,led7;

clk_gen u_clk(.clk(clk));
cd4017 u_cd4017(.clk(clk), .reset(reset), .inhibit(inhibit), .cout(cout), .q(q));

led u_led0(.clk(q[0]), .out(led0));
led u_led1(.clk(q[1]), .out(led1));
led u_led2(.clk(q[2]), .out(led2));
led u_led3(.clk(q[3]), .out(led3));
led u_led4(.clk(q[4]), .out(led4));
led u_led5(.clk(q[5]), .out(led5));
led u_led6(.clk(q[6]), .out(led6));
led u_led7(.clk(q[7]), .out(led7));

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, top_tb);

    reset   = 1'b1;
    inhibit = 1'b0;
    #20;
    reset = 1'b0;
    #400;
    $finish;
end
endmodule
