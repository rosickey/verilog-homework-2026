`timescale 1ns/1ns
module top_tb;

    wire clk1;
    wire clk2;

    clk_gen_ov #(.PERIOD(20), .DUTY(50)) u_clk1(.clk(clk1));
    clk_gen_ov #(.PERIOD(40), .DUTY(25)) u_clk2(.clk(clk2));

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        #200 $finish;
    end

endmodule
