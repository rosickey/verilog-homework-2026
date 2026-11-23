module top_tb;
    wire clk;
    wire [9:0] q_unit;
    wire [9:0] q_tens;
    wire co_unit;
    reg clr;
    reg en;

    clk_gen u_clk (.clk(clk));

    CD4017 u_unit (
        .clk(clk),
        .en(en),
        .clr(clr),
        .q(q_unit),
        .co(co_unit)
    );

    CD4017 u_tens (
        .clk(clk),
        .en(co_unit & en),
        .clr(clr),
        .q(q_tens),
        .co()
    );

    // 波形导出：放在模块里面！
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

    // 激励
    initial begin
        clr = 1'b1;
        en  = 1'b0;
        #20;
        clr = 1'b0;
        en  = 1'b1;
        #2000;
        $finish;
    end

    // 打印
    initial begin
        $monitor("time=%0t, clr=%b, en=%b, q_unit=%b, q_tens=%b",
                 $time, clr, en, q_unit, q_tens);
    end

endmodule