module top_tb;
    wire clk;
    clk_gen u_clk(clk);

    reg reset;
    reg inhibit;
    wire [9:0] q;
    wire cout;

    cd4017 u_cd4017(
        clk,
        reset,
        inhibit,
        cout,
        q
    );

    wire led0,led1,led2,led3,led4,led5,led6,led7;
    led u_led0(q[0],led0);
    led u_led1(q[1],led1);
    led u_led2(q[2],led2);
    led u_led3(q[3],led3);
    led u_led4(q[4],led4);
    led u_led5(q[5],led5);
    led u_led6(q[6],led6);
    led u_led7(q[7],led7);

    initial begin
        $dumpfile("done");
        $dumpvars(0,top_tb);
        reset = 1;
        inhibit = 1;
        #20 reset = 0;
        #20 inhibit = 0;
        #400;
        reset = 1;
        #20 reset = 0;
        #200;
        $finish;
    end
endmodule