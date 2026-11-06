// cd4017.v : decade counter with 10 one-hot outputs
//
//   clk : counter clock, the count advances on the rising edge
//   en  : count enable, 1 = count, 0 = hold the current state
//   clr : clear, 1 = q = 10'b0000000001 (Q0), highest priority
//   q   : q[n] high means the counter is in state n, only one bit is ever high
//
// As on the real CD4017, clr is asynchronous: driving it high returns the
// counter to Q0 immediately, without waiting for a clock edge.  en is sampled
// on the rising edge.  The decade sequence is 0,1,...,9,0,1,...

`timescale 1ns / 1ps
`default_nettype none

module cd4017(
	input  wire       clk,
	input  wire       en,
	input  wire       clr,
	output wire [9:0] q
);

	reg [3:0] cnt;
	reg [9:0] q_reg;

	// 4-bit decade counter: asynchronous clear, enable sampled on clk
	always @(posedge clk or posedge clr) begin
		if (clr)
			cnt <= 4'd0;
		else if (en) begin
			if (cnt == 4'd9)
				cnt <= 4'd0;
			else
				cnt <= cnt + 4'd1;
		end
	end

	// one-hot decode of the counter state
	always @(*) begin
		case (cnt)
			4'd0: q_reg = 10'b0000000001;
			4'd1: q_reg = 10'b0000000010;
			4'd2: q_reg = 10'b0000000100;
			4'd3: q_reg = 10'b0000001000;
			4'd4: q_reg = 10'b0000010000;
			4'd5: q_reg = 10'b0000100000;
			4'd6: q_reg = 10'b0001000000;
			4'd7: q_reg = 10'b0010000000;
			4'd8: q_reg = 10'b0100000000;
			4'd9: q_reg = 10'b1000000000;
			default: q_reg = 10'b0000000001;
		endcase
	end

	assign q = q_reg;

endmodule

`default_nettype wire
