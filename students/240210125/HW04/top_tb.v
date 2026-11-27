`timescale 1ns / 1ps

module top_tb;
    wire clk1;
    wire clk2;
    wire clk3;

    clk_gen_o u_clk1(clk1);
    clk_gen_o u_clk2(clk2);
    clk_gen_o u_clk3(clk3);

    defparam u_clk1.PERIOD = 20;
    defparam u_clk1.DUTY   = 50;

    defparam u_clk2.PERIOD = 100;
    defparam u_clk2.DUTY   = 20;

    defparam u_clk3.PERIOD = 40;
    defparam u_clk3.DUTY   = 75;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        #500 $finish;
    end

    initial begin
        $monitor("time=%0t  clk1=%b  clk2=%b  clk3=%b", $time, clk1, clk2, clk3);
    end
endmodule
