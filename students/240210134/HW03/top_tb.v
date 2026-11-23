module top_tb;

    wire clk;
    reg reset;
    reg inhibit;
    wire [9:0] q0;
    wire [9:0] q1;
    wire cout0;
    wire cout1;
    wire cout0_neg;

    assign cout0_neg = ~cout0;

    clk_gen u1 (clk);
    cd4017 u2 (clk, reset, inhibit, cout0, q0);
    cd4017 u3 (cout0_neg, reset, inhibit, cout1, q1);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset = 1;
        inhibit = 0;
        #25;
        reset = 0;
        #2025;
        $finish;
    end

endmodule
