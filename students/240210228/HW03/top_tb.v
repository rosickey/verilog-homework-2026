`timescale 1ns/1ps

module top_tb;
    wire clk;
    reg reset;
    wire units_cout;
    wire tens_cout;
    wire [9:0] units_q;
    wire [9:0] tens_q;
    integer errors;

    clk_gen u_clk_gen(clk);
    cd4017 u_units(clk,reset,1'b0,units_cout,units_q);
    cd4017 u_tens(clk,reset,!units_cout,tens_cout,tens_q);

    task check_value;
        input [3:0] tens;
        input [3:0] units;
        begin
            if ((tens_q !== (10'b0000_0000_01 << tens)) ||
                (units_q !== (10'b0000_0000_01 << units))) begin
                errors = errors + 1;
                $display("ERROR at %0t: expected %0d%0d, got tens=%b units=%b",
                         $time,tens,units,tens_q,units_q);
            end
        end
    endtask

    task tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    initial begin
        $dumpfile("HW03.vcd");
        $dumpvars(0,top_tb);
        errors = 0;
        reset = 1'b1;
        #2;
        check_value(0,0);
        reset = 1'b0;

        // Check 00 through 09, then the carry into the tens digit.
        repeat (9) tick;
        check_value(0,9);
        tick;
        check_value(1,0);

        // Continue to 99, then verify decimal rollover to 00.
        repeat (89) tick;
        check_value(9,9);
        tick;
        check_value(0,0);

        // Asynchronous reset must clear both counters immediately.
        repeat (27) tick;
        check_value(2,7);
        #3 reset = 1'b1;
        #1;
        check_value(0,0);
        #4 reset = 1'b0;
        tick;
        check_value(0,1);

        if (errors == 0)
            $display("HW03 TEST PASS");
        else
            $display("HW03 TEST FAIL: %0d errors",errors);
        $finish;
    end
endmodule
