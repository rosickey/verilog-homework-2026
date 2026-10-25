// -----------------------------------------------------------------------------
// top_tb.v : self-checking testbench for the parameterized ALU (top.v)
//
// The testbench derives the expected result from an independent behavioural
// model, then compares y / carry / zero against the DUT.  Directed corner
// cases are applied first, followed by randomized vectors.
//
// A summary is printed at the end; "TEST PASSED" means no mismatch was seen.
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps
`default_nettype none

module top_tb;

    localparam integer WIDTH        = 8;
    localparam integer RANDOM_TESTS = 400;

    reg  [WIDTH-1:0] a;
    reg  [WIDTH-1:0] b;
    reg  [2:0]       op;

    wire [WIDTH-1:0] y;
    wire             zero;
    wire             carry;

    integer checks;
    integer errors;
    integer k;

    top #(.WIDTH(WIDTH)) dut (
        .a     (a),
        .b     (b),
        .op    (op),
        .y     (y),
        .zero  (zero),
        .carry (carry)
    );

    // ------------------------------------------------------------------
    // Reference model, written independently of the DUT implementation.
    // ------------------------------------------------------------------
    reg [WIDTH-1:0] exp_y;
    reg             exp_carry;
    reg             exp_zero;
    integer         sh;

    task model;
        begin
            exp_y     = {WIDTH{1'b0}};
            exp_carry = 1'b0;
            sh        = b % WIDTH;                 // shift amount 0 .. WIDTH-1
            case (op)
                3'd0: {exp_carry, exp_y} = {1'b0, a} + {1'b0, b};  // ADD
                3'd1: {exp_carry, exp_y} = {1'b0, a} - {1'b0, b};  // SUB / borrow
                3'd2: exp_y = a & b;                               // AND
                3'd3: exp_y = a | b;                               // OR
                3'd4: exp_y = a ^ b;                               // XOR
                3'd5: exp_y = ~a;                                  // NOT
                3'd6: exp_y = a << sh;                             // SHL
                3'd7: exp_y = a >> sh;                             // SHR
                default: ;
            endcase
            exp_zero = (exp_y == {WIDTH{1'b0}});
        end
    endtask

    // ------------------------------------------------------------------
    // Apply one vector and compare against the model.
    // ------------------------------------------------------------------
    task check;
        input [WIDTH-1:0] va;
        input [WIDTH-1:0] vb;
        input [2:0]       vop;
        begin
            a  = va;
            b  = vb;
            op = vop;
            #1;
            model;
            checks = checks + 1;
            if ((y !== exp_y) || (carry !== exp_carry) || (zero !== exp_zero)) begin
                errors = errors + 1;
                $display("FAIL: op=%0d a=%0d b=%0d | y=0x%02h (exp 0x%02h) carry=%b (exp %b) zero=%b (exp %b)",
                         op, a, b, y, exp_y, carry, exp_carry, zero, exp_zero);
            end
        end
    endtask

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        checks = 0;
        errors = 0;

        $display("--- directed tests ---");

        // ADD: identity, overflow/carry, mixed operands
        check(8'd0,   8'd0,   3'd0);
        check(8'd1,   8'd0,   3'd0);
        check(8'd255, 8'd1,   3'd0);   // carry out
        check(8'd128, 8'd127, 3'd0);
        check(8'd127, 8'd1,   3'd0);

        // SUB: normal, borrow, equal operands
        check(8'd5,   8'd3,   3'd1);
        check(8'd3,   8'd5,   3'd1);   // borrow
        check(8'd0,   8'd0,   3'd1);
        check(8'd0,   8'd1,   3'd1);   // borrow, result 0xFF
        check(8'd255, 8'd255, 3'd1);

        // Bitwise operations against all-zeros / all-ones
        check(8'hF0,  8'h0F,  3'd2);
        check(8'hFF,  8'h00,  3'd2);
        check(8'hF0,  8'h0F,  3'd3);
        check(8'hFF,  8'hFF,  3'd3);
        check(8'hAA,  8'h55,  3'd4);
        check(8'hAA,  8'hAA,  3'd4);   // zero flag
        check(8'h00,  8'h00,  3'd5);
        check(8'hFF,  8'h00,  3'd5);

        // Shifts at the corners of the shift range
        check(8'h01,  8'd0,   3'd6);
        check(8'h01,  8'd1,   3'd6);
        check(8'h81,  8'd1,   3'd6);
        check(8'hFF,  8'd7,   3'd6);
        check(8'h55,  8'd255, 3'd6);   // 255 mod 8 == 7
        check(8'h80,  8'd0,   3'd7);
        check(8'h80,  8'd1,   3'd7);
        check(8'h80,  8'd7,   3'd7);
        check(8'hAA,  8'd255, 3'd7);

        $display("--- %0d random tests ---", RANDOM_TESTS);
        for (k = 0; k < RANDOM_TESTS; k = k + 1) begin
            check($random, $random, $random);
        end

        $display("---------------------------------------------");
        $display("checks = %0d, errors = %0d", checks, errors);
        if (errors == 0) begin
            $display("TEST PASSED");
        end else begin
            $display("TEST FAILED");
        end
        $display("---------------------------------------------");
        $finish;
    end

endmodule

`default_nettype wire
