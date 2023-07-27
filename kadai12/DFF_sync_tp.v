`timescale 1ns/1ns

module DFF_sync_tp;

reg CK, D, LD, RB, SB;
wire Q, QB;

parameter STEP = 100;

always begin
	CK = 0 ; #(STEP/2);
	CK = 1 ; #(STEP/2);
end

DFF_sync DFF_sync(CK, D, LD, Q, QB, RB, SB);

initial begin
		RB=1'b1; SB=1'b1; LD=1'b0; D=1'b0; 
	#STEP 	RB=1'b1; SB=1'b0; LD=1'b0; D=1'b0; 
	#STEP 	RB=1'b0; SB=1'b1; LD=1'b0; D=1'b0;
	#STEP 	RB=1'b1; SB=1'b1; LD=1'b0; D=1'b0;
	#STEP 	RB=1'b1; SB=1'b1; LD=1'b0; D=1'b1;
	#STEP 	RB=1'b1; SB=1'b1; LD=1'b1; D=1'b0;
	#STEP 	RB=1'b1; SB=1'b1; LD=1'b1; D=1'b1;	
        #STEP 	$finish;
end

initial $monitor($stime, " CK=%b RB=%b SB=%b LD=%b D=%b Q=%b QB=%b", CK, RB, SB, LD, D, Q, QB);

endmodule
