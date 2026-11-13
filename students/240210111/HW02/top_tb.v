module top_tb;
    wire clk;
    wire [9:0] q;
    wire cout;

    reg reset;
    reg inhibit;

    wire led0_out,led1_out,led2_out,led3_out;
    wire led4_out,led5_out,led6_out,led7_out;

    clk_gen u_clk(clk);

    cd4017 u_cd4017(clk, reset, inhibit, cout, q);

    led u_led0(q[0], led0_out);
    led u_led1(q[1], led1_out);
    led u_led2(q[2], led2_out);
    led u_led3(q[3], led3_out);
    led u_led4(q[4], led4_out);
    led u_led5(q[5], led5_out);
    led u_led6(q[6], led6_out);
    led u_led7(q[7], led7_out);

    initial begin
        reset = 1'b1;
        inhibit = 1'b1;
        #20
        reset = 1'b0;
        inhibit = 1'b0;
        #300
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,top_tb);
    end

endmodule
