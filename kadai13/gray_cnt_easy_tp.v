`timescale 1ps/1ps
module gray_cnt_easy_tp;
reg  ck, res;
wire  [2:0] q; 
parameter STEP = 100000;
gray_cnt_easy uut(ck, res, q); // Instance name changed to 'uut' for clarity

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
initial $monitor( $stime, " res=%b q=%b", res, q);
endmodule
