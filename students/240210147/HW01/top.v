// -----------------------------------------------------------------------------
// top.v : parameterized combinational ALU
//
// Operation encoding (op):
//   3'b000  ADD   y = a + b                    carry = carry-out of a+b
//   3'b001  SUB   y = a - b                    carry = borrow  (1 = a < b)
//   3'b010  AND   y = a & b                    carry = 0
//   3'b011  OR    y = a | b                    carry = 0
//   3'b100  XOR   y = a ^ b                    carry = 0
//   3'b101  NOT   y = ~a                       carry = 0
//   3'b110  SHL   y = a << s                   carry = 0   (s = b[SHAMT-1:0])
//   3'b111  SHR   y = a >> s                   carry = 0   (s = b[SHAMT-1:0])
//
// carry is only meaningful for ADD and SUB; it is tied to 0 for every other
// operation so the module has no undefined behaviour.
// zero is asserted when y is all zero.
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps
`default_nettype none

module top #(
    parameter integer WIDTH = 8
) (
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [2:0]       op,
    output reg  [WIDTH-1:0] y,
    output wire             zero,
    output reg              carry
);

    // Number of bits needed to hold a shift amount of 0 .. WIDTH-1.
    localparam integer SHAMT = (WIDTH > 1) ? $clog2(WIDTH) : 1;

    localparam [2:0] OP_ADD = 3'b000,
                     OP_SUB = 3'b001,
                     OP_AND = 3'b010,
                     OP_OR  = 3'b011,
                     OP_XOR = 3'b100,
                     OP_NOT = 3'b101,
                     OP_SHL = 3'b110,
                     OP_SHR = 3'b111;

    // One extra bit keeps the carry-out / borrow information.
    wire [WIDTH:0] sum_ext = {1'b0, a} + {1'b0, b};
    wire [WIDTH:0] dif_ext = {1'b0, a} - {1'b0, b};

    always @* begin
        // Defaults keep the design free of inferred latches.
        y     = {WIDTH{1'b0}};
        carry = 1'b0;

        case (op)
            OP_ADD: begin
                y     = sum_ext[WIDTH-1:0];
                carry = sum_ext[WIDTH];
            end
            OP_SUB: begin
                y     = dif_ext[WIDTH-1:0];
                carry = dif_ext[WIDTH];          // 1 means a borrow occurred
            end
            OP_AND: y = a & b;
            OP_OR : y = a | b;
            OP_XOR: y = a ^ b;
            OP_NOT: y = ~a;
            OP_SHL: y = a << b[SHAMT-1:0];
            OP_SHR: y = a >> b[SHAMT-1:0];
            default: begin
                y     = {WIDTH{1'b0}};
                carry = 1'b0;
            end
        endcase
    end

    assign zero = (y == {WIDTH{1'b0}});

endmodule

`default_nettype wire
