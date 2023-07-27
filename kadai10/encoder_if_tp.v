`timescale 1ps/1ps

module encoder_if_tp;
reg [7:0] din;
wire [2:0] dout;

parameter STEP = 1000;

encoder_if encoder_if( din, dout );

initial begin
            din =8'b11111111;
    #STEP   din =8'b10000000; 
    #STEP   din =8'b01111111;
    #STEP   din =8'b01000000;
    #STEP   din =8'b00111111; 
    #STEP   din =8'b00100000;
    #STEP   din =8'b00011111; 
    #STEP   din =8'b00010000; 
    #STEP   din =8'b00001111;
    #STEP   din =8'b00001000; 
    #STEP   din =8'b00000111; 
    #STEP   din =8'b00000100;
    #STEP   din =8'b00000011; 
    #STEP   din =8'b00000010; 
    #STEP   din =8'b00000001; 
    #STEP   din =8'b00000000; 
    #STEP   $finish;
end

initial $monitor( $stime, " din=%h dout=%h ", din, dout);

endmodule

