module top_tb;
    wire clk;
    clk_gen u_clk(clk);

    reg reset;
    reg inhibit;
    reg ten_inhibit;
    wire cout_ones;
    wire cout_tens;
    wire [9:0] q_ones;
    wire [9:0] q_tens;

    always @(posedge clk) begin
        ten_inhibit <= ~q_ones[9];
    end

    cd4017 u_ones(clk, reset, inhibit, cout_ones, q_ones);
    cd4017 u_tens(clk, reset, ten_inhibit, cout_tens, q_tens);

    initial begin
        $dumpfile("done");
        $dumpvars();
        reset = 1'b1;
        inhibit = 1'b0;
        #100 reset = 1'b0;
        #1000 inhibit = 1'b1;
        #200  inhibit = 1'b0;
        #1010 $finish;
    end
endmodule