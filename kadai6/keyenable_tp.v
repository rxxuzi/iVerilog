`timescale 1ps/1ps

module keyenable_tp;
reg  ck, reset;
reg  [9:0] tenkey;

parameter STEP = 1000;	
always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

keyenable keyenable( ck, reset, tenkey);

initial begin
                reset = 0; tenkey=0;
    #STEP       reset = 1;
    #STEP       reset = 0;
    #(STEP*4) tenkey[0]=0;
    #(STEP*4) tenkey[0]=1;
    #(STEP*4) tenkey[1]=0;
    #(STEP*4) tenkey[1]=1;
    #(STEP*4) tenkey[2]=0;
    #(STEP*4) tenkey[2]=1;
    #(STEP*4) tenkey[3]=0;
    #(STEP*4) tenkey[3]=1;
    #(STEP*4) tenkey[4]=0;
    #(STEP*4) tenkey[4]=1;
    #(STEP*4) tenkey[5]=0;
    #(STEP*4) tenkey[5]=1;
    #(STEP*4) tenkey[6]=0;
    #(STEP*4) tenkey[6]=1;
    #(STEP*4) tenkey[7]=0;
    #(STEP*4) tenkey[7]=1;
    #(STEP*4) tenkey[8]=0;
    #(STEP*4) tenkey[8]=1;
    #(STEP*4) tenkey[9]=0;
    #(STEP*4) tenkey[9]=1;
    #(STEP*4)	$finish;
end

initial $monitor( $stime, " ck=%b reset=%b tenkey=%b ke1=%b ke2=%b key_enbl=%b ", ck, reset, tenkey, keyenable.ke1, keyenable.ke2, keyenable.key_enbl);
endmodule