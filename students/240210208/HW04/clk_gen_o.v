`timescale 1ns/1ps

module clk_gen(clk,zkb,zq);
    input [7:0] zkb;
    input [7:0] zq;
    output clk;
    reg clk;
    integer t_high,t_low;

    initial
    begin
        clk=0;
        wait(zq>=20 && zkb>=10 && zkb<=90);
        forever
        begin
            t_high=zq*zkb/100;
            t_low=zq-t_high;
            #(t_low) clk=1;
            #(t_high) clk=0;
        end
    end
endmodule
