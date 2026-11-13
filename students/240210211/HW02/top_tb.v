module test16;
	wire clk;
	clk_gen u_clk(clk);
	reg reset;
	reg inhibit;
	wire cout;
	wire[9:0] q;
	wire[7:0] led;
	wire led0, led1,led2,led3,led4,led5,led6,led7;
	assign led[0]=q[0];
	assign led[1]=q[1];
	assign led[2]=q[2];
	assign led[3]=q[3];
	assign led[4]=q[4];
	assign led[5]=q[5];
	assign led[6]=q[6];
	assign led[7]=q[7];
	assign led={led7,led6,led5,led4,led3,led2,led1,led0};
	CD4017 u_cd4017(clk,reset,inhibit,cout,q); 
	initial
	begin
		$dumpfile("done");
		$dumpvars();
		reset=1;inhibit=1;
		#5 reset=0;
		#30 inhibit=0;
		#300 inhibit=1;
		#100 inhibit=0;
		#100 reset=0;
		#200 $finish();
	end
endmodule
		

