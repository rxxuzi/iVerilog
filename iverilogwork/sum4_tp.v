`timescale 1ns/1ns

module sum4_tp;
reg [3:0] a,b;
wire [3:0] sum;
wire carry;
parameter STEP = 100;

sum4 sum4(a,b,sum,carry);

initial begin

		a=4'h0; b=4'h0; 
	#STEP 	a=4'h1; b=4'h1; 
	#STEP 	a=4'hf; b=4'h1;
	#STEP 	a=4'hf; b=4'hf;
	#STEP 	$finish;
end

initial $monitor($stime, " a=%h b=%h carry=%b sum=%h", a,b,carry,sum);

endmodule
