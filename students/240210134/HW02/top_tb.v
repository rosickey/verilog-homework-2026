module top_tb;

    wire clk;
    reg reset;
    reg inhibit;
    wire cout;
    wire [9:0] q;
    wire [7:0] led_out;

    clk_gen u1 (clk);
    cd4017 u2 (clk, reset, inhibit, cout, q);

    led led0 (q[0], led_out[0]);
    led led1 (q[1], led_out[1]);
    led led2 (q[2], led_out[2]);
    led led3 (q[3], led_out[3]);
    led led4 (q[4], led_out[4]);
    led led5 (q[5], led_out[5]);
    led led6 (q[6], led_out[6]);
    led led7 (q[7], led_out[7]);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset = 1;
        inhibit = 0;
        #25;
        reset = 0;
        #250;
        $finish;
    end

endmodule
