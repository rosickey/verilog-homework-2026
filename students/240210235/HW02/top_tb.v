  module top_tb;
reg reset, inhibit;
wire clk;
wire cout;
wire [9:0] q;


clk_gen u_clk_gen(
    .clk(clk)
);


cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(inhibit),
    .cout(cout),
    .q(q)
);


led u_led0(.clk(q[0]), .out(led0_out));
led u_led1(.clk(q[1]), .out(led1_out));
led u_led2(.clk(q[2]), .out(led2_out));
led u_led3(.clk(q[3]), .out(led3_out));
led u_led4(.clk(q[4]), .out(led4_out));
led u_led5(.clk(q[5]), .out(led5_out));
led u_led6(.clk(q[6]), .out(led6_out));
led u_led7(.clk(q[7]), .out(led7_out));


initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);

    reset = 1'b1;
    inhibit = 1'b1;
    #200;
    reset = 1'b0;
    inhibit = 1'b0; 
    #2000;
    inhibit = 1'b1;
    #300;
    $finish;
end

endmodule