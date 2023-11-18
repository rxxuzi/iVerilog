module beginend_tp;

reg A,B,C;

parameter STEP = 1000;

initial begin
	A=0; B=1; C=0;
     # 50	A=1;
     #50	A=0; C=1;
     #50	B=0;
     #50	$finish;
end

initial $monitor( $stime, " A=%b B=%b C=%b", A, B, C); 

endmodule
