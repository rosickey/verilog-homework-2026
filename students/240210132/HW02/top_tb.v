`timescale 1ns/1ps

module top_tb;
        wire        clk;
        reg         reset;
        reg         inhibit;
        wire        cout;
        wire [9:0]  q;
        wire        led0, led1, led2, led3, led4, led5, led6, led7;

        clk_gen u_clk_gen ( .clk(clk) );

        cd4017 u_cd4017 (
                .clk(clk),
                .reset(reset),
                .inhibit(inhibit),
                .cout(cout),
                .q(q)
        );

        led u_led0 (.clk(q[0]), .out(led0));
        led u_led1 (.clk(q[1]), .out(led1));
        led u_led2 (.clk(q[2]), .out(led2));
        led u_led3 (.clk(q[3]), .out(led3));
        led u_led4 (.clk(q[4]), .out(led4));
        led u_led5 (.clk(q[5]), .out(led5));
        led u_led6 (.clk(q[6]), .out(led6));
        led u_led7 (.clk(q[7]), .out(led7));

        initial begin
                $dumpfile("report.vcd");
                $dumpvars(0, top_tb);
                $timeformat(-9, 0, " ns", 10);

                reset   = 1'b1;
                inhibit = 1'b0;

                #40  reset = 1'b0;

                #390 reset = 1'b1;
                #110 reset = 1'b0;

                #120 inhibit = 1'b1;

                #70  $finish;
        end

        initial
                $monitor("time=%0t  clk=%b  reset=%b  inhibit=%b  cout=%b  q=%b  led=%b%b%b%b%b%b%b%b",
                         $time, clk, reset, inhibit, cout, q,
                         led7, led6, led5, led4, led3, led2, led1, led0);
endmodule