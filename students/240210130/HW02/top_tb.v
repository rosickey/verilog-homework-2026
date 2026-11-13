//top_tb.v
module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire cout;
    wire [9:0] q;
    wire [7:0] led_out;

    clk_gen u_clk(
        .clk(clk)
    );

    cd4017 u_cd4017(
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .cout(cout),
        .q(q)
    );

    led u_led0(.clk(q[0]), .out(led_out[0]));
    led u_led1(.clk(q[1]), .out(led_out[1]));
    led u_led2(.clk(q[2]), .out(led_out[2]));
    led u_led3(.clk(q[3]), .out(led_out[3]));
    led u_led4(.clk(q[4]), .out(led_out[4]));
    led u_led5(.clk(q[5]), .out(led_out[5]));
    led u_led6(.clk(q[6]), .out(led_out[6]));
    led u_led7(.clk(q[7]), .out(led_out[7]));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset = 1'b1;
        inhibit = 1'b0;
        #20 reset = 1'b0;
        #310 $finish;
    end
endmodule
