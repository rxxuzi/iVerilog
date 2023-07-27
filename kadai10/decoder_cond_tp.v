`timescale 1ps/1ps

module decoder_cond_tp;
reg [1:0] din;
wire [3:0] dout;

parameter STEP = 1000;

decoder_cond decoder_cond(din, dout);

initial begin
            din[1]=0; din[0]=0;
    #STEP   din[1]=0; din[0]=1; 
    #STEP   din[1]=1; din[0]=0; 
    #STEP   din[1]=1; din[0]=1; 
    #STEP   $finish;
end

initial $monitor( $stime, " din=%h dout=%b ", din, dout);

endmodule

