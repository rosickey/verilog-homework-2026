`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg start_reset;
    wire reset;
    wire cout;
    wire [9:0] q;
    wire [7:0] lights;

    clk_gen u_clk(.clk(clk));
    assign reset = start_reset | q[8];
    cd4017 u_cd4017(.clk(clk), .reset(reset), .inhibit(1'b0),
                      .cout(cout), .q(q));
    led u_led0(.clk(q[0]), .out(lights[0]));
    led u_led1(.clk(q[1]), .out(lights[1]));
    led u_led2(.clk(q[2]), .out(lights[2]));
    led u_led3(.clk(q[3]), .out(lights[3]));
    led u_led4(.clk(q[4]), .out(lights[4]));
    led u_led5(.clk(q[5]), .out(lights[5]));
    led u_led6(.clk(q[6]), .out(lights[6]));
    led u_led7(.clk(q[7]), .out(lights[7]));

    initial
    begin
        $dumpfile("hw02.vcd");
        $dumpvars(0, top_tb);
        start_reset = 1'b1;
        #5 start_reset = 1'b0;
        #480 $finish;
    end
endmodule
