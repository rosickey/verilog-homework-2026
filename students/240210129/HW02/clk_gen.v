module clk_gen(clk);
    output clk;
    initial
    begin
        clk <= 0;
        forever #10 clk <= ~clk;
    end
endmodule
