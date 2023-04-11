`timescale 1ns/1ns

module gnot_tp;
reg a;
wire b;
parameter STEP = 100;

gnot gnot(a,b);

initial begin
    $dumpfile("gnot_tp.vcd"); // vcd file name
    $dumpvars(0,gnot_tp);     // dump targetは「全部」

		a=1'b0; 
	#STEP 	a=1'b1;  
	#STEP 	a=1'b0; 
	#STEP 	$finish;
end

initial $monitor($stime, "a=%b b=%b", a,b);

endmodule
