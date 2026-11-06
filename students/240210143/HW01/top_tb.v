// top_tb.v : testbench for the CD4017 decade counter
//
// Instantiates clk_gen (square wave stimulus) and cd4017 (device under test),
// then exercises the situations the design has to handle:
//   1. clear while the clock is running   -> q returns to Q0
//   2. free running count 0 .. 9          -> the one-hot output walks and wraps
//   3. en = 0                             -> the count is held
//   4. clear in the middle of a sequence  -> q returns to Q0 immediately
//
// The waveform of this run is written to hw01.vcd and is the source of
// report.png.

`timescale 1ns / 1ps
`default_nettype none

module top_tb;

	wire       clk;
	reg        en;
	reg        clr;
	wire [9:0] q;

	// square wave stimulus, period = 20 ns
	clk_gen u_clk_gen(
		.clk (clk)
	);

	// device under test
	cd4017 u_cd4017(
		.clk (clk),
		.en  (en),
		.clr (clr),
		.q   (q)
	);

	// position of the single high bit in q (0 .. 9)
	function integer index_of(input [9:0] v);
		integer i;
		begin
			index_of = 0;
			for (i = 0; i < 10; i = i + 1)
				if (v[i]) index_of = i;
		end
	endfunction

	// state index of the one-hot output, kept as a net so that $strobe can
	// sample it (Icarus only accepts simple signals in $strobe)
	wire [3:0] state;
	assign state = index_of(q);

	// log every change together with the simulation time; $strobe prints at
	// the end of the time step, so the values shown are the settled ones
	always @(q, en, clr) begin
		$strobe("t=%0t  en=%b clr=%b  q=%b  state=%0d",
		        $time, en, clr, q, state);
	end

	initial begin
		$dumpfile("hw01.vcd");
		$dumpvars(0, top_tb);
		$timeformat(-9, 0, " ns", 6);

		en  = 1'b0;
		clr = 1'b1;          // start from the cleared state

		#25 clr = 1'b0;      // release clear, counter still disabled
		#20 en  = 1'b1;      // 45 ns: start counting

		#360 en = 1'b0;      // 405 ns: disable, the count must freeze
		#60  en = 1'b1;      // 465 ns: resume from the frozen state

		#60 clr = 1'b1;      // 525 ns: clear in the middle of the sequence
		#20 clr = 1'b0;      // 545 ns: release clear, counting continues

		#100 $display("---- end of test ----");
		$finish;
	end

endmodule

`default_nettype wire
