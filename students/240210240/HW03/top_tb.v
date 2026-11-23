module top_tb;
wire clk;
reg reset;

wire [9:0] q_low;
wire [9:0] q_high;
wire carry;
reg q_low_dly;

wire cout_low;
wire cout_high;

clk_gen u_clk( clk );

always @(posedge clk or posedge reset) begin
    if(reset) begin
        q_low_dly <= 1'b0;
    end
    else begin
        q_low_dly <= (q_low == 10'b1000000000);
    end
end
assign carry = q_low_dly && (q_low != 10'b1000000000);

cd4017 u_low( clk, reset, 1'b0, cout_low, q_low );
cd4017 u_high( carry, reset, 1'b0, cout_high, q_high );

initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
    reset = 1;
    #20 reset = 0;
    #4000 $finish;
end

endmodule
