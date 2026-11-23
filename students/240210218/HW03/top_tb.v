module top_tb;
    wire clk;
    reg reset;
    wire cout_unit;
    wire cout_tens;
    wire [9:0] q_unit;
    wire [9:0] q_tens;
    wire inhibit_unit;
    wire inhibit_tens;
    wire [3:0] count_unit;
    wire [3:0] count_tens;

    clk_gen u_clk_gen(clk);

    assign inhibit_unit = 1'b0;
    cd4017 u_unit(clk, reset, inhibit_unit, cout_unit, q_unit);

    assign inhibit_tens = ~cout_unit;
    cd4017 u_tens(clk, reset, inhibit_tens, cout_tens, q_tens);

    assign count_unit = u_unit.count;
    assign count_tens = u_tens.count;

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        reset = 1;
        #25;
        reset = 0;

        #2000;
        $finish;
    end
endmodule
