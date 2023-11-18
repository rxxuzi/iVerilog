module forkjoin_tp;

reg A,B,C;

parameter STEP = 1000;

initial fork
	A=0; B=1; C=0;
     # 50	A=1;
     #100	A=0;
     #100	C=1;
     #150	B=0;
     #200	$finish;
join

initial $monitor( $stime, " A=%b B=%b C=%b", A, B, C); 

endmodule
