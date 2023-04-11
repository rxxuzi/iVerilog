`timescale 1ns/1ns

module gexor_tp;
reg a,b;
wire c;
parameter STEP = 100;

gexor gexor(a,b,c);

initial begin
    $dumpfile("gexor_tp.vcd"); // vcd file name
    $dumpvars(0,gexor_tp);     // dump targetは「全部」

		a=1'b0; b=1'b0; 
	#STEP 	a=1'b0; b=1'b1; 
	#STEP 	a=1'b1; b=1'b0;
	#STEP 	a=1'b1; b=1'b1;
	#STEP 	a=1'b0; b=1'b0;
	#STEP 	$finish;
end

initial $monitor($stime, "a=%b b=%b c=%b", a,b,c);

endmodule
