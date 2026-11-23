module top_tb;

    wire clk;
    reg reset;
    reg inhibit;

    wire cout_units;
    wire cout_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;
    wire carry;

    wire [3:0] units_count;
    wire [3:0] tens_count;

    clk_gen u_clk_gen(clk);

    cd4017 u_units(clk, reset, inhibit, cout_units, q_units);
    assign carry = ~cout_units;
    cd4017 u_tens(carry, reset, inhibit, cout_tens, q_tens);

    assign units_count = u_units.count;
    assign tens_count = u_tens.count;

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        reset = 1;
        inhibit = 0;

        #25 reset = 0;
        #975 $finish;
    end

endmodule
