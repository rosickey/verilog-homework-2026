`timescale 1ns/1ps
module top_tb;
wire clk;
reg reset;
reg inhibit;
wire cout_u;
wire cout_t;
wire clk_t;
wire u0,u1,u2,u3,u4,u5,u6,u7,u8,u9;
wire t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;

clk_gen u_clk_gen(clk);
cd4017 u_units(clk,reset,inhibit,cout_u,{u9,u8,u7,u6,u5,u4,u3,u2,u1,u0});
cd4017 u_tens(clk_t,reset,inhibit,cout_t,{t9,t8,t7,t6,t5,t4,t3,t2,t1,t0});

assign clk_t = ~cout_u;

initial
begin
	$dumpfile("top_tb.vcd");
	$dumpvars(0,top_tb);
	reset=1;
	inhibit=0;
	#25 reset=0;
	#2075 $finish;
end
endmodule
