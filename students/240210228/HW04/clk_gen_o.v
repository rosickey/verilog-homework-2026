`timescale 1ns/1ps

// zkb: duty cycle in percent (1-99)
// zq : period in nanoseconds (2-255)
// frequency = 1000 / zq MHz
module clk_gen_o(zkb, zq, clk);
    input [7:0] zkb;
    input [7:0] zq;
    output reg clk;

    integer cnt;
    integer high_time;

    initial begin
        clk = 1'b0;
        cnt = 0;
    end

    // One simulation tick is 1 ns. The output is high for zkb percent
    // of every zq-nanosecond period, with at least 1 ns high and low.
    always #1 begin
        if (zq < 2) begin
            clk = 1'b0;
            cnt = 0;
        end else begin
            high_time = (zq * zkb) / 100;
            if (high_time < 1)
                high_time = 1;
            if (high_time > zq - 1)
                high_time = zq - 1;

            clk = (cnt < high_time);

            if (cnt >= zq - 1)
                cnt = 0;
            else
                cnt = cnt + 1;
        end
    end
endmodule
