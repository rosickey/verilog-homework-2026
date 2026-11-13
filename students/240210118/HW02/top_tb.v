module top_tb;
wire clk;
reg reset;
reg inhibit;
wire cout;
wire [9:0] q;
wire led0,led1,led2,led3,led4,led5,led6,led7;

clk_gen u_clk_gen(clk);
cd4017 u_cd4017(clk,reset,inhibit,cout,q);

led u_led0(q[0],led0);
led u_led1(q[1],led1);
led u_led2(q[2],led2);
led u_led3(q[3],led3);
led u_led4(q[4],led4);
led u_led5(q[5],led5);
led u_led6(q[6],led6);
led u_led7(q[7],led7);

initial
begin
    $dumpfile("wave.vcd");      // 波形文件，GTKWave 打开
    $dumpvars();
    reset = 1;  inhibit = 0;    // 上电复位
    #20  reset = 0;             // 20 释放复位，8 个灯开始依次点亮
    #155 inhibit = 1;           // 175 禁止计数，流水灯停住
    #60  inhibit = 0;           // 235 恢复计数
    #160 $finish();             // 395 结束
end
endmodule
