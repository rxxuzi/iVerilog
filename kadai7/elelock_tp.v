`timescale 1ps/1ps

module elelock_tp;
reg  ck, reset, close;
reg  [9:0] tenkey;
wire lock;

parameter STEP = 1000;	
always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

elelock elelock( ck, reset, tenkey, close, lock );

initial begin
                reset = 0; tenkey=0; close=0;
    #STEP       reset = 1;
    #STEP       reset = 0;
    #(STEP*4)  close = 1;
    #STEP       close = 0;
    #(STEP*4) tenkey[8]=1;
    #(STEP*4) tenkey[8]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[4]=0;
    #(STEP*4) tenkey[6]=1;
    #(STEP*4) tenkey[6]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[4]=0;
    #(STEP*4) tenkey[9]=1;
    #(STEP*4) tenkey[9]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[4]=0;
    #(STEP*4) close=1;
    #STEP	close=0;
    #(STEP*4)	$finish;
end

initial $monitor( $stime, " reset=%b close=%b tenkey=%b key=%h%h%h%h lock=%b", reset, close, tenkey, elelock.key[3], elelock.key[2], elelock.key[1], elelock.key[0], lock);
endmodule