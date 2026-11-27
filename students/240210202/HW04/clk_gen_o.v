`timescale 1ns/1ps
module clk_gen(clk, zkb, zq);
    input [7:0] zkb;
    input [7:0] zq;
    output clk;
    reg clk;
    real high_time;
    real low_time;

    // zq: period in ns, 2..255; zkb: high-level duty cycle in %, 1..99.
    // Sample both inputs at the beginning of each complete cycle.
    initial
    begin
        clk = 1'b0;
        forever
        begin
            wait ((zq >= 2) && (zkb >= 1) && (zkb <= 99));
            high_time = 1.0 * zq * zkb / 100.0;
            low_time = zq - high_time;
            #(low_time) clk = 1'b1;
            #(high_time) clk = 1'b0;
        end
    end
endmodule
