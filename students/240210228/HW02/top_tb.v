`timescale 1ns/1ps

module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire cout;
    wire [9:0] q;
    wire led0,led1,led2,led3,led4,led5,led6,led7;
    integer errors;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk,reset,inhibit,cout,q);
    led u_led0(q[0],led0);
    led u_led1(q[1],led1);
    led u_led2(q[2],led2);
    led u_led3(q[3],led3);
    led u_led4(q[4],led4);
    led u_led5(q[5],led5);
    led u_led6(q[6],led6);
    led u_led7(q[7],led7);

    initial begin
        $dumpfile("HW02.vcd");
        $dumpvars(0,top_tb);
        errors = 0;
        reset = 1'b1;
        inhibit = 1'b1;

        #2;
        if ((q !== 10'b0000_0000_01) || (cout !== 1'b0) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0001))
            errors = errors + 1;

        #3 reset = 1'b0;
        inhibit = 1'b0;
        #7;
        if ((q !== 10'b0000_0000_10) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0010))
            errors = errors + 1;

        #120;
        if ((q !== 10'b0010_0000_00) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b1000_0000))
            errors = errors + 1;

        #40;
        if ((q !== 10'b10_0000_0000) || (cout !== 1'b1) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0000))
            errors = errors + 1;

        #20;
        if ((q !== 10'b0000_0000_01) || (cout !== 1'b0) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0001))
            errors = errors + 1;

        #3 inhibit = 1'b1;
        #35;
        if ((q !== 10'b0000_0000_01) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0001))
            errors = errors + 1;

        #5 inhibit = 1'b0;
        #17;
        if (q !== 10'b0000_0000_10)
            errors = errors + 1;

        #3 reset = 1'b1;
        #1;
        if ((q !== 10'b0000_0000_01) ||
            ({led7,led6,led5,led4,led3,led2,led1,led0} !== 8'b0000_0001))
            errors = errors + 1;

        #15 reset = 1'b0;
        #20;
        if (q !== 10'b0000_0000_10)
            errors = errors + 1;

        if (errors == 0)
            $display("HW02 TEST PASS");
        else
            $display("HW02 TEST FAIL: %0d errors",errors);
        $finish;
    end
endmodule
