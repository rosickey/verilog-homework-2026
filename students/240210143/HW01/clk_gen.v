// clk_gen.v : square wave stimulus generator
//
// Port list and coding style follow the corrected version used in class:
// "output reg clk", blocking assignment and "forever #10 clk = ~clk".
//
// `timescale is required so that #10 always means 10 ns no matter which
// simulator / library order is used (without it Icarus Verilog falls back to
// the default time unit and the clock never advances inside a ns-based
// testbench).

`timescale 1ns / 1ps

module clk_gen(clk);
	output reg clk;

initial
begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

endmodule
