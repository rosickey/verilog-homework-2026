module cd4511( input A,B,C,D,output reg a,b,c,d,e,f,g);
	reg [3:0] bcd;
	always @(*) begin
  bcd= {D,C,B,A};
  case(bcd)
       		 4'd0: {a,b,c,d,e,f,g} = 7'b111_1110;
       		 4'd1: {a,b,c,d,e,f,g} = 7'b011_0000;
        	 4'd2: {a,b,c,d,e,f,g} = 7'b110_1101;
        	 4'd3: {a,b,c,d,e,f,g} = 7'b111_1001;
        	 4'd4: {a,b,c,d,e,f,g} = 7'b011_0011;
       		 4'd5: {a,b,c,d,e,f,g} = 7'b101_1011;
        	 4'd6: {a,b,c,d,e,f,g} = 7'b101_1111;
        	 4'd7: {a,b,c,d,e,f,g} = 7'b111_0000;
       		 4'd8: {a,b,c,d,e,f,g} = 7'b111_1111;
        	 4'd9: {a,b,c,d,e,f,g} = 7'b111_1011;
       		 default: {a,b,c,d,e,f,g}=7'b000_0000;
    endcase
end
endmodule
