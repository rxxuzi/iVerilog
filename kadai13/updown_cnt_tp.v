`timescale 1ps/1ps
module updown_cnt_tp;
reg  ck, res, down;
wire  [3:0] q; 
parameter STEP = 100000;
updown_cnt updown_cnt(ck, res, down, q); 
always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end
initial begin
            res = 0; 
    #STEP   res = 1; 
    #STEP   res = 0; down = 0;
    #(STEP*10) down = 1;
    #(STEP*10) 
	    $finish;
end
initial $monitor( $stime, " ck=%b res=%b down=%b q=%h", ck, res, down, q); 
endmodule
