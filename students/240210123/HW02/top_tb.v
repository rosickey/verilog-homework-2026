module test;
    wire clk;
    reg en, clr;
    wire [9:0] q;
    wire cout;
    wire [7:0] led_out;

    clk_gen u_clk(clk);
    cd4017 u_4017(clk, clr, en, cout, q);

    led u_led0(q[0], led_out[0]);
    led u_led1(q[1], led_out[1]);
    led u_led2(q[2], led_out[2]);
    led u_led3(q[3], led_out[3]);
    led u_led4(q[4], led_out[4]);
    led u_led5(q[5], led_out[5]);
    led u_led6(q[6], led_out[6]);
    led u_led7(q[7], led_out[7]);

    initial begin
        en = 1; clr = 1;
        #25  clr = 0;
        #20  en = 0;
        #200 en = 1;
        #40  clr = 1;
        #20  clr = 0;
        #20  en = 0;
        #200 $finish();
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
    end
endmodule
