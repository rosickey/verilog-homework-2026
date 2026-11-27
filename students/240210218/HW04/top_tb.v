module top_tb;
    wire clk_a;
    wire clk_b;
    wire clk_c;

    clk_gen_o #(20, 50) u_a(clk_a);
    clk_gen_o #(20, 25) u_b(clk_b);
    clk_gen_o #(40, 75) u_c(clk_c);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #400;
        $finish;
    end
endmodule
