`timescale 1ps/1ps
module cnt_unit_tp;
reg     ck, res, en; 
wire   q, ca; 
parameter STEP = 100000;

cnt_unit cnt_unit(ck, res, en, q, ca); 

always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

initial begin
            res = 0; en = 0;
    #STEP   res = 1; en = 0;
    #STEP   res = 0; en = 0;
    #STEP   res = 0; en = 0;
    #STEP   res = 0; en = 1;
    #STEP   res = 0; en = 1;
    #STEP   res = 0; en = 1;
    #STEP   res = 1; en = 1;
    #STEP   $finish;
end

initial $monitor( $stime, " ck=%b res=%b en=%b q=%b ca=%b", ck,res, en, q, ca); 

endmodule