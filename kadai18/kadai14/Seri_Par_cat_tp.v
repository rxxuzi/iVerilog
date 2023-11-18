`timescale 1ps/1ps
module Seri_Par_cat_tp;

reg  ck, res, en, si;
wire  [3:0] q; 
parameter STEP = 100000;

Seri_Par_cat Seri_Par_cat( ck, res, en, si, q); 

always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

initial begin
            res = 0; en=0; si=0;
    #STEP   res = 1; en=0; si=0;
    #STEP   res = 0; en=1; si=1;
    #STEP   res = 0; en=1; si=0;
    #STEP   res = 0; en=1; si=1;
    #STEP   res = 0; en=1; si=1;
    #STEP   res = 0; en=1; si=0;
    #STEP   res = 0; en=1; si=0;
    #STEP   $finish;
end

initial $monitor( $stime, " ck=%b res=%b en=%b si=%b q=%b ", ck, res, en, si, q); 

endmodule
