module test;
    wire clk;
    reg en, clr;
    wire [9:0] q0;
    wire [9:0] q1;
    wire cout0;
    wire cout1;

    clk_gen u_clk(clk);

   
    cd4017 u_cd4017_0(clk, clr, en, cout0, q0);
   
    cd4017 u_cd4017_1(cout0, clr, en, cout1, q1);


    initial begin
        en = 1; clr = 1;
        #25  clr = 0;
        #20  en = 0;
        #200 en = 1;
        #40  clr = 1;
        #20  clr = 0;
        #20  en = 0;
        #200 $finish();
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
    end

endmodule
