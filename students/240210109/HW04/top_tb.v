module top_tb;
    reg [7:0] zkb,zq;
    wire clk;

    clk_gen_o uut(zkb,zq,clk);

    initial begin
    zkb = 10; zq = 20;   
    #200;
    zkb = 20; zq = 10;   
    #200;
    zkb = 15; zq = 30;   
    #200 $finish;
end


    initial $dumpvars;
endmodule
