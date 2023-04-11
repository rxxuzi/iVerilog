`timescale 1ps/1ps
module count_tp;
reg  ck, res;
wire  [3:0] q; 
parameter STEP = 100000;
counter counter(ck, res, q); 
always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end
initial begin
            res = 0;
    #STEP   res = 1;
    #STEP   res = 0;
    #(STEP*20)
	    $finish;
end
initial $monitor( $stime, " ck=%b res=%b q=%h", ck,res,q); 
endmodule