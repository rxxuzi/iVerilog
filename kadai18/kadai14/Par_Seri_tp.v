`timescale 1ps/1ps
module Par_Seri_tp;

reg  ck, en, ld;
reg [3:0] pi;
wire so;
parameter STEP = 100000;

Par_Seri Par_Seri( ck, en, ld, pi, so );

always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

initial begin
            ld=0; en=0; pi=4'hd;
    #STEP   ld=1; en=0;
    #STEP   ld=0; en=1;
    #STEP   ld=0; en=1;
    #STEP   ld=0; en=1;
    #STEP   ld=0; en=1;
    #STEP   ld=0; en=1;
    #STEP   $finish;
end

initial $monitor( $stime, " ck=%b ld=%b en=%b ps=%b so=%b", ck, ld, en, Par_Seri.ps, so); 

endmodule
