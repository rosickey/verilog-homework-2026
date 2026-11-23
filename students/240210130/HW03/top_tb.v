//top_tb.v
module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire cout_units;
    wire cout_tens;
    wire clk_tens;
    wire [9:0] q_units;
    wire [9:0] q_tens;

    clk_gen u_clk(
        .clk(clk)
    );

    // 个位：每个时钟加 1，计到 9 后回到 0
    cd4017 u_units(
        .clk(clk),
        .reset(reset),
        .inhibit(inhibit),
        .cout(cout_units),
        .q(q_units)
    );

    // 个位是 9 时 cout_units 为高；回到 0 时它下降，取反后正好是十位的进位上升沿
    assign clk_tens = ~cout_units;

    // 十位：每收到一个个位进位加 1，计到 9 后回到 0
    cd4017 u_tens(
        .clk(clk_tens),
        .reset(reset),
        .inhibit(inhibit),
        .cout(cout_tens),
        .q(q_tens)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        reset = 1'b1;
        inhibit = 1'b0;
        #20 reset = 1'b0;
        #1030 $finish;
    end
endmodule
