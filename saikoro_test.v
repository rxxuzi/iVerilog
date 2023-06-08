`timescale 1ps/1ps

module saikoro_test;
reg  ck, reset, enable;
wire  [6:0] lamp;

parameter STEP = 1000;

always begin
    ck = 0; #( STEP/2 );
    ck = 1; #( STEP/2 );
end

saikoro sai( ck, reset, enable, lamp );

initial begin
            reset = 0; enable=0;
    #STEP   reset = 1;
    #STEP   reset = 0;
    #STEP   enable = 1;
    #(STEP*5)
                  enable = 0;
    #STEP   enable = 1;
    #(STEP*5)
                  $finish;
end
initial $monitor( $stime, " reset=%b enable=%b saikoro=%h lamp=%b", reset, enable, sai.cnt, lamp);

endmodule  	