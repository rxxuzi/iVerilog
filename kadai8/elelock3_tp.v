`timescale 1ps/1ps

module elelock3_tp;
reg  ck, reset, close;
reg  [9:0] tenkey;
wire lock;

parameter STEP = 1000;	
always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

elelock3 elelock3( ck, reset, tenkey, close, lock );

initial begin
                reset = 0; tenkey=0; close=0;
    #STEP       reset = 1;
    #STEP       reset = 0;
    #(STEP*4) tenkey[1]=1;
    #(STEP*4) tenkey[1]=0;
    #(STEP*4) tenkey[2]=1;
    #(STEP*4) tenkey[2]=0;
    #(STEP*4) tenkey[3]=1;
    #(STEP*4) tenkey[3]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[4]=0;
    #(STEP*4) close=1;
    #STEP     close=0;
    #(STEP*4) tenkey[5]=1;
    #(STEP*4) tenkey[5]=0;
    #(STEP*4) tenkey[1]=1;
    #(STEP*4) tenkey[1]=0;
    #(STEP*4) tenkey[2]=1;
    #(STEP*4) tenkey[2]=0;
    #(STEP*4) tenkey[3]=1;
    #(STEP*4) tenkey[3]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[4]=0;
    #STEP       reset = 1;
    #STEP       reset = 0;
    #(STEP*4) tenkey[9]=1;
    #(STEP*4) tenkey[9]=0;
    #(STEP*4) close=1;
    #STEP     close=0;
    #(STEP*4) tenkey[9]=1;
    #(STEP*4) tenkey[9]=0;
    #(STEP*4)	$finish;
end

initial $monitor( $stime, " reset=%b close=%b tenkey=%b key=%h%h%h%h secret_key=%h%h%h%h lock=%b", reset, close, tenkey, elelock3.key[3], elelock3.key[2], elelock3.key[1], elelock3.key[0], elelock3.secret_key[3], elelock3.secret_key[2], elelock3.secret_key[1], elelock3.secret_key[0],lock);
endmodule