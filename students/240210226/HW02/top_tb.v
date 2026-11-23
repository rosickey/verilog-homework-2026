`timescale 1ns / 1ns

module top_tb;

    wire       clk;
    reg        reset;
    reg        inhibit;
    wire       cout;
    wire [9:0] q;

    wire led0;
    wire led1;
    wire led2;
    wire led3;
    wire led4;
    wire led5;
    wire led6;
    wire led7;

    clk_gen u_clk_gen
    (
        .clk (clk)
    );

    cd4017 u_cd4017
    (
        .clk     (clk),
        .reset   (reset),
        .inhibit (inhibit),
        .cout    (cout),
        .q       (q)
    );

    led u_led0 (.clk (q[0]), .out (led0));
    led u_led1 (.clk (q[1]), .out (led1));
    led u_led2 (.clk (q[2]), .out (led2));
    led u_led3 (.clk (q[3]), .out (led3));
    led u_led4 (.clk (q[4]), .out (led4));
    led u_led5 (.clk (q[5]), .out (led5));
    led u_led6 (.clk (q[6]), .out (led6));
    led u_led7 (.clk (q[7]), .out (led7));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        $monitor("%5t | rst=%b inh=%b cout=%b q=%b | LED7..0=%b%b%b%b%b%b%b%b",
                 $time, reset, inhibit, cout, q,
                 led7, led6, led5, led4, led3, led2, led1, led0);
    end

    initial begin
        reset   = 1'b1;
        inhibit = 1'b0;

        #25 reset = 1'b0;

        #475 $finish;
    end

endmodule
