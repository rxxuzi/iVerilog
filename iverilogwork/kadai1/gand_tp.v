`timescale 1ns/1ns

module gand_tp;
reg a,b;
wire c;
parameter STEP = 100;

gand gand(a,b,c);

initial begin
    $dumpfile("gand_tp.vcd"); // vcd file name
    $dumpvars(0,gand_tp);     // dump targetは「全部」

		a=1'b0; b=1'b0; 
	#STEP 	a=1'b0; b=1'b1; 
	#STEP 	a=1'b1; b=1'b0;
	#STEP 	a=1'b1; b=1'b1;
	#STEP 	a=1'b0; b=1'b0;
	#STEP 	$finish;
end

initial $monitor($stime, "a=%b b=%b c=%b", a,b,c);

endmodule
