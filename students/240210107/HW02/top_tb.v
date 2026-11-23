module top_tb;
    reg reset;
    reg inhibit;
    wire [7:0] led_out; 
    wire clk;
    wire [9:0] q;
    wire cout_dummy;
    clk_gen u_clk_gen (clk);
    cd4017 u_cd4017 (
    clk,
    reset,
    inhibit,
    cout_dummy,
    q
    );
    led u_led0 (q[0], led_out[0]);
    led u_led1 (q[1], led_out[1]);
    led u_led2 (q[2], led_out[2]);
    led u_led3 (q[3], led_out[3]);
    led u_led4 (q[4], led_out[4]);
    led u_led5 (q[5], led_out[5]);
    led u_led6 (q[6], led_out[6]);
    led u_led7 (q[7], led_out[7]);
    initial begin
        reset = 1;
        inhibit = 1;
        #25;
        reset = 0;
        #20;
        inhibit = 0;
        #1000;
        $finish;
    end
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb); 
    end
endmodule