`timescale 1ns/1ns
module clk_gen
#(
    parameter real PERIOD  = 20.0,
    parameter real DUTY    = 0.5
)
(
    output reg clk
);

real high_time;
real low_time;

initial begin
    clk = 0;
    high_time = PERIOD * DUTY;
    low_time  = PERIOD * (1.0 - DUTY);
    forever begin
        #low_time  clk = 1'b1;
        #high_time clk = 1'b0;
    end
end

endmodule
