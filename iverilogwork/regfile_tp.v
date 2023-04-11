`timescale 1ps/1ps
module regfile_tp;

reg ck, we;
reg [7:0] din;
reg [1:0] inaddr, outaddr;
wire [7:0] dout;

parameter STEP = 100000;

regfile regfile( ck, we, din, inaddr, dout, outaddr );

always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

initial begin
            we=0; din=8'h01; inaddr=0; outaddr=0;
    #STEP   we=1; din=8'h01; inaddr=0; outaddr=0;
    #STEP   we=1; din=8'h02; inaddr=1; outaddr=0;
    #STEP   we=1; din=8'h03; inaddr=2; outaddr=0;
    #STEP   we=1; din=8'h04; inaddr=3; outaddr=0;
    #STEP   we=0; din=8'h00; inaddr=3; outaddr=0;
    #STEP   we=0; din=8'h00; inaddr=3; outaddr=1;
    #STEP   we=0; din=8'h00; inaddr=3; outaddr=2;
    #STEP   we=0; din=8'h00; inaddr=3; outaddr=3;
    #STEP   $finish;
end

initial $monitor( $stime, " ck=%b we=%b din=%b inaddr=%b outaddr=%b dout=%b", ck, we, din, inaddr, outaddr, dout); 

endmodule
