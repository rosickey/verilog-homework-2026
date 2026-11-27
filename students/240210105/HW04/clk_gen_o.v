// 可调时钟发生器
// zkb：占空比对应的高电平时间
// zq ：时钟总周期
// 如果高电平时间小于总周期，正常输出时钟；否则输出低电平
module clk_gen(zkb, zq, clk);
    input [7:0] zkb;
    input [7:0] zq;
    output reg clk;

    initial
    begin
        clk = 1'b0;
        forever
        begin
            if(zkb < zq)
            begin
                # zkb
                clk = 1'b1;

                # (zq - zkb)
                clk = 1'b0;
            end
            else
            begin
                clk = 1'b0;
            end
        end
    end
endmodule
