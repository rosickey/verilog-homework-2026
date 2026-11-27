module clk_gen;
    input  [7:0] zkb;   
    input  [7:0] zq;    
    output reg   clk;

    real period;
    real high_time;

    initial begin
        clk = 1'b0;
        forever begin
            period    = zkb * 2;
            high_time = period * (zq / 255.0);

            clk <= 1'b1;
            #(high_time);
            clk <= 1'b0;
            #(period - high_time);
        end
    end

endmodule