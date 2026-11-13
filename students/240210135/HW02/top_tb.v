module top_tb;
wire       clk;
wire       reset;
wire       cout;
wire [9:0] q;
clk_gen u_clk_gen(
    .clk(clk),
    .reset(reset)
);
cd4017 u_cd4017(
    .clk(clk),
    .reset(reset),
    .inhibit(1'b0),
    .cout(cout),
    .q(q)
);
led u_led0(.clk(q[0]), .out());
led u_led1(.clk(q[1]), .out());
led u_led2(.clk(q[2]), .out());
led u_led3(.clk(q[3]), .out());
led u_led4(.clk(q[4]), .out());
led u_led5(.clk(q[5]), .out());
led u_led6(.clk(q[6]), .out());
led u_led7(.clk(q[7]), .out());
initial begin
    #200 $finish;
end

endmodule
