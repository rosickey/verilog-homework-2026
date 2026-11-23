wire o0,o1,o2,o3,o4,o5,o6,o7;

assign inhibit = 1'b0; 

clk_gen u_clk_gen(.clk(clk));
cd4017 u_cd4017(.clk(clk),.reset(reset),.inhibit(inhibit),.cout(cout),.q(q));
led u_led0(.clk(q[0]),.out(o0));
led u_led1(.clk(q[1]),.out(o1));
led u_led2(.clk(q[2]),.out(o2));
led u_led3(.clk(q[3]),.out(o3));
led u_led4(.clk(q[4]),.out(o4));
led u_led5(.clk(q[5]),.out(o5));
led u_led6(.clk(q[6]),.out(o6));
led u_led7(.clk(q[7]),.out(o7));

initial begin
    $dumpfile("done.vcd");
    $dumpvars(0,top_tb);
    reset = 1'b1;  
    #10;
    reset = 1'b0;  
    #650;
    $finish;
end

endmodule
