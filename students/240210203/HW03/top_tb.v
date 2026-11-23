module top_tb;
    wire clk;
    reg reset;
    reg inhibit;
    wire cout_units,cout_tens;
    wire [9:0] q_units,q_tens;
    wire clk_tens;

    clk_gen u_clk_gen(clk);
    cd4017 u_units(clk,reset,inhibit,cout_units,q_units);

    assign clk_tens=~cout_units;
    cd4017 u_tens(clk_tens,reset,inhibit,cout_tens,q_tens);

    wire [3:0] units=onehot2num(q_units);
    wire [3:0] tens=onehot2num(q_tens);
    wire [7:0] number={tens,units};

    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0,top_tb);
        reset=1;
        inhibit=0;
        #30 reset=0;
        #2200 $finish;
    end

    function [3:0] onehot2num;
        input [9:0] q;
        begin
            case(q)
                10'b0000000001: onehot2num=4'd0;
                10'b0000000010: onehot2num=4'd1;
                10'b0000000100: onehot2num=4'd2;
                10'b0000001000: onehot2num=4'd3;
                10'b0000010000: onehot2num=4'd4;
                10'b0000100000: onehot2num=4'd5;
                10'b0001000000: onehot2num=4'd6;
                10'b0010000000: onehot2num=4'd7;
                10'b0100000000: onehot2num=4'd8;
                10'b1000000000: onehot2num=4'd9;
                default:        onehot2num=4'd0;
            endcase
        end
    endfunction
endmodule