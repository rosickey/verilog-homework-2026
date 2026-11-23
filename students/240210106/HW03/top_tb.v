module top_tb;
    wire clk;
    reg reset;
    reg inhibit;

    wire [9:0] q0;
    wire cout0;
    wire [9:0] q1;
    wire cout1;

    wire cout0_neg;
    assign cout0_neg = ~cout0;

    clk_gen u_clk_gen(clk);

    cd4017 u_low(clk, reset, inhibit, cout0, q0);
    cd4017 u_high(cout0_neg, reset, inhibit, cout1, q1);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset = 1;
        inhibit = 0;
        #20 reset = 0;
        #2520 $finish;
    end
endmodule
