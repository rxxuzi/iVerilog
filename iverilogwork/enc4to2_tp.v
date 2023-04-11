`timescale 1ns/1ns

module enc4to2_tp;
reg [3:0] din;
wire [1:0] dout;
parameter STEP = 100;

enc4to2 enc4to2(din, dout);

initial begin

		din=4'b0001; 
	#STEP 	din=4'b0010; 
	#STEP 	din=4'b0100;
	#STEP 	din=4'b1000;
	#STEP 	din=4'b1111;
	#STEP 	$finish;
end

initial $monitor($stime, " din=%b dout=%b", din, dout);

endmodule
