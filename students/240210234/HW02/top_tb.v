`timescale 1ns/1ps

module top_tb;

    wire clk;
    reg reset;
    reg inhibit;
    wire cout;
    wire [9:0] q;

    wire out0;
    wire out1;
    wire out2;
    wire out3;
    wire out4;
    wire out5;
    wire out6;
    wire out7;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk, reset, inhibit, cout, q);

    led u_led0(q[0], out0);
    led u_led1(q[1], out1);
    led u_led2(q[2], out2);
    led u_led3(q[3], out3);
    led u_led4(q[4], out4);
    led u_led5(q[5], out5);
    led u_led6(q[6], out6);
    led u_led7(q[7], out7);

    initial
        begin
            reset = 1'b1;
            inhibit = 1'b1;
            #20 reset = 1'b0;
            #10 inhibit = 1'b0;
            #200 inhibit = 1'b1;
            #60 inhibit = 1'b0;
            #140 reset = 1'b1;
            #10 reset = 1'b0;
            #210 $finish;
        end

    initial
        begin
            $dumpfile("top_tb.vcd");
            $dumpvars(0, top_tb);
        end

endmodule

