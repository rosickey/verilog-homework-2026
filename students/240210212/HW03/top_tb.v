module top_tb;
    wire clk;
    clk_gen u_clk(clk);
    reg reset;
    reg inhibit;
    wire cout_ones;
    wire cout_tens;
    wire [9:0] q_ones;
    wire [9:0] q_tens;
    cd4017 u_ones(clk, reset, inhibit, cout_ones, q_ones);
    cd4017 u_tens(~cout_ones, reset, inhibit, cout_tens, q_tens);
    initial begin
        $dumpfile("done");
        $dumpvars();
        reset = 1;
        inhibit = 0;
        #100 reset = 0;
        #1000 inhibit = 1;
        #200 inhibit = 0;
        #1010 $finish;
    end
endmodule