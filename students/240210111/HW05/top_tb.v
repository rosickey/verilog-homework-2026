module tb_cd4511;
    reg A,B,C,D;
    wire a,b,c,d,e,f,g;
    cd4511 uut ( A,B,C,D,a,b,c,d,e,f,g);
    	initial
	begin
       		 $dumpfile("done.vcd");
        		 $dumpvars();
       			 {D,C,B,A} = 4'd0; #20;
       			 {D,C,B,A} = 4'd1; #20;
        			 {D,C,B,A} = 4'd2; #20;
        			 {D,C,B,A} = 4'd3; #20;
       			 {D,C,B,A} = 4'd4; #20;
       			 {D,C,B,A} = 4'd5; #20;
        			 {D,C,B,A} = 4'd6; #20;
        			 {D,C,B,A} = 4'd7; #20;
      		           {D,C,B,A} = 4'd8; #20;
        			 {D,C,B,A} = 4'd9; #20;	
			 $finish;
    end
endmodule
