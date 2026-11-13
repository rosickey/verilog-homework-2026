`timescale 1ns/1ps

module top_tb;
        wire        clk;
        reg         reset;
        reg         inhibit;
        wire        cout;
        wire [9:0]  q;
        wire [7:0]  led;

        clk_gen u_clk_gen ( .clk(clk) );

        cd4017 u_cd4017 (
                .clk(clk),
                .reset(reset),
                .inhibit(inhibit),
                .cout(cout),
                .q(q)
        );

        led u_led0 (.clk(q[0]), .out(led[0]));
        led u_led1 (.clk(q[1]), .out(led[1]));
        led u_led2 (.clk(q[2]), .out(led[2]));
        led u_led3 (.clk(q[3]), .out(led[3]));
        led u_led4 (.clk(q[4]), .out(led[4]));
        led u_led5 (.clk(q[5]), .out(led[5]));
        led u_led6 (.clk(q[6]), .out(led[6]));
        led u_led7 (.clk(q[7]), .out(led[7]));

        initial begin
                $dumpfile("report.vcd");
                $dumpvars(0, top_tb);
                $timeformat(-9, 0, " ns", 10);

                reset   = 1'b1;
                inhibit = 1'b0;

                #25 reset = 1'b0;

                #400 $finish;
        end

        initial
                $monitor("time=%0t  clk=%b  reset=%b  inhibit=%b  cout=%b  q=%b  led=%b",
                         $time, clk, reset, inhibit, cout, q, led);
endmodule