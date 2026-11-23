`timescale 1ns/1ps

module top_tb;
    wire clk;
    reg reset,inhibit;
    wire cout_units,cout_tens;
    wire [9:0] q_units,q_tens;
    wire clk_tens;

    clk_gen u_clk(clk);
    cd4017 u_units(clk,reset,inhibit,cout_units,q_units);
    assign clk_tens = ~cout_units;
    cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

    initial begin
        reset = 1'b1;
        inhibit = 1'b0;
        #25 reset = 1'b0;
        #2080 $finish;
    end

    initial begin
        $dumpfile("done.vcd");
        $dumpvars(0,top_tb);
    end
endmodule
