`timescale 1ns / 1ps

module top_tb;
    wire clk;
    reg  clr;
    reg  en;
    wire [9:0] q;
    cd4017 u_cd4017 (
        clk, 
        clr, 
        en, 
        q
    );
    clk_gen u_clk_gen (
        clk
    );
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        clr = 1; en = 0;
        #25 clr = 0;
        #200 en = 1;
        #100 en = 0;
        
        #250 clr = 1;
        #10  clr = 0;
        
        #100 $finish;
    end
endmodule