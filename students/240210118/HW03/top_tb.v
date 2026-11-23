module top_tb;
wire clk;
reg reset;
reg inhibit;
wire cout_unit;
wire cout_ten;
wire [9:0] q_unit;
wire [9:0] q_ten;
wire carry_ten;

clk_gen u_clk_gen(clk);

// 个位进位：模块中 cout = !(count<9)，即个位为 9 时 cout 为高。
// 取反后，个位 9->0 的瞬间产生上升沿，作为十位的时钟，
// 使十位正好在 09->10 那一刻进位。
assign carry_ten = ~cout_unit;

cd4017 u_units(clk,reset,inhibit,cout_unit,q_unit);     // 个位
cd4017 u_tens (carry_ten,reset,inhibit,cout_ten,q_ten); // 十位

initial
begin
    $dumpfile("wave.vcd");          // 波形文件，GTKWave 打开
    $dumpvars();
    reset = 1;  inhibit = 0;        // 上电复位，两位同时清 0
    #20  reset = 0;                 // 释放复位，开始两位十进制计数
    #2010 $finish();                // 跑满 100 个时钟：00~99 再回到 00
end
endmodule
