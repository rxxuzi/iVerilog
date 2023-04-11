`timescale 1ns/1ns

module DFF_tp;

reg CK, D;
wire Q;
parameter STEP = 100;

always begin
	CK = 0 ; #(STEP/2);
	CK = 1 ; #(STEP/2);
end

DFF DFF(CK, D, Q);

initial begin

		D=1'b0; 
	#STEP 	D=1'b1; 
	#STEP 	D=1'b0;
	#STEP 	$finish;
end

initial $monitor($stime, " CK=%b D=%b Q=%b", CK, D, Q);

endmodule
