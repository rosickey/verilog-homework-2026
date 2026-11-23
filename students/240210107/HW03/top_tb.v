module top_tb;
reg reset;
reg inhibit;
wire clk;
wire [9:0] q0; 
wire [9:0] q1;  
wire cout0;
wire cout1;
wire clk_ten;
assign clk_ten = ~q0[9];
clk_gen u_clk_gen(
    clk
);
cd4017 u_unit(
    clk,
    reset,
    inhibit,
    cout0,
    q0
);
cd4017 u_ten(
    clk_ten,
    reset,
    inhibit,
    cout1,
    q1
);
initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);
    reset   = 1'b1;
    inhibit = 1'b0;
    #100;
    reset = 1'b0;  
    #1000;
    inhibit = 1'b1;     
    #200;
    inhibit = 1'b0;      
    #990;
    $finish;
end
endmodule