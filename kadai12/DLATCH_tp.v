`timescale 1ns/1ns

module DLATCH_tp;

reg G, D;
wire Q;
parameter STEP = 100;

DLATCH DLATCH(G, D, Q);

initial begin

		G=1'b0; D=1'b0; 
	#STEP 	G=1'b0; D=1'b1; 
	#STEP 	G=1'b1; D=1'b0;
	#STEP 	G=1'b1; D=1'b1;
	#STEP 	G=1'b0; D=1'b0;
	#STEP 	$finish;
end

initial $monitor($stime, " G=%b D=%b Q=%b", G, D, Q);

endmodule
