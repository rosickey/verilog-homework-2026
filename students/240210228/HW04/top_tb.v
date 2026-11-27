`timescale 1ns/1ps

module top_tb;
    reg [7:0] duty_a;
    reg [7:0] period_a;
    reg [7:0] duty_b;
    reg [7:0] period_b;
    wire clk_a;
    wire clk_b;

    integer errors;
    integer rises_a;
    integer rises_b;
    integer last_rise_a;
    integer last_rise_b;

    // 50 MHz, 50% duty cycle.
    clk_gen_o gen_a(duty_a, period_a, clk_a);
    // 25 MHz, 25% duty cycle.
    clk_gen_o gen_b(duty_b, period_b, clk_b);

    always @(posedge clk_a) begin
        if (rises_a > 0 && $time - last_rise_a != 20) begin
            $display("FAIL: clk_a period was %0d ns", $time - last_rise_a);
            errors = errors + 1;
        end
        last_rise_a = $time;
        rises_a = rises_a + 1;
    end

    always @(negedge clk_a) begin
        if (rises_a > 0 && $time - last_rise_a != 10) begin
            $display("FAIL: clk_a high time was %0d ns", $time - last_rise_a);
            errors = errors + 1;
        end
    end

    always @(posedge clk_b) begin
        if (rises_b > 0 && $time - last_rise_b != 40) begin
            $display("FAIL: clk_b period was %0d ns", $time - last_rise_b);
            errors = errors + 1;
        end
        last_rise_b = $time;
        rises_b = rises_b + 1;
    end

    always @(negedge clk_b) begin
        if (rises_b > 0 && $time - last_rise_b != 10) begin
            $display("FAIL: clk_b high time was %0d ns", $time - last_rise_b);
            errors = errors + 1;
        end
    end

    initial begin
        $dumpfile("HW04.vcd");
        $dumpvars(0, top_tb);

        errors = 0;
        rises_a = 0;
        rises_b = 0;
        last_rise_a = 0;
        last_rise_b = 0;
        duty_a = 8'd50;
        period_a = 8'd20;
        duty_b = 8'd25;
        period_b = 8'd40;

        #400;
        if (rises_a < 10 || rises_b < 5) begin
            $display("FAIL: too few clock cycles observed");
            errors = errors + 1;
        end

        if (errors == 0)
            $display("HW04 TEST PASS: 50 MHz/50%% and 25 MHz/25%%");
        else
            $display("HW04 TEST FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule
