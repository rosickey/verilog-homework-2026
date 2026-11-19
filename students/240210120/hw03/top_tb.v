module top_tb;
wire clk_out;
wire [9:0] q1;  
wire [9:0] q2;  
reg rst_n;
wire carry;

assign carry = q1[9];

clk_gen u_clk_gen(
    clk_out,
    rst_n
);

cd4017 u_cd4017_1(
    clk_out,
    rst_n,
    q1
);

cd4017 u_cd4017_2(
    carry,
    rst_n,
    q2
);

initial begin
    rst_n = 0;
    #20 rst_n = 1;
    #2000 $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_tb);
end
endmodule