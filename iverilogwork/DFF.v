module DFF(CK, D, Q);
input CK, D;
output Q;
reg Q;

always @(posedge CK)
	Q <= D;

endmodule
