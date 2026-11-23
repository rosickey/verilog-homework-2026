module top_tb;

wire clk_sig;
reg reset_sig;
wire inhibit_sig;

wire cout_unit;
wire cout_ten;
wire [9:0] q_unit;
wire [9:0] q_ten;

wire clk_ten;

assign inhibit_sig = 1'b0;
assign clk_ten = ~cout_unit;

clk_gen u_clk_gen(clk_sig);
cd4017 u_unit(clk_sig, reset_sig, inhibit_sig, cout_unit, q_unit);
cd4017 u_ten(clk_ten, reset_sig, inhibit_sig, cout_ten, q_ten);

initial begin
    $dumpfile("done");
    $dumpvars(0,top_tb);
    reset_sig = 1'b1;
    #20
    reset_sig = 1'b0;
    #2000
    $finish;
end

endmodule