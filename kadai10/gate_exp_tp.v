`timescale 1ps/1ps

module gate_exp_tp;
reg in0, in1, in2; 
wire out_not, out_and2, out_and3;

parameter STEP = 1000;

gate_exp gate_exp(in0, in1, in2, out_not, out_and2, out_and3);

initial begin
            in0=1'b0; in1=1'b0; in2=1'b0;
    #STEP   in0=1'b1; in1=1'b0; in2=1'b0;
    #STEP   in0=1'b0; in1=1'b1; in2=1'b0;
    #STEP   in0=1'b1; in1=1'b1; in2=1'b0;
    #STEP   in0=1'b0; in1=1'b0; in2=1'b1;
    #STEP   in0=1'b1; in1=1'b0; in2=1'b1;
    #STEP   in0=1'b0; in1=1'b1; in2=1'b1;
    #STEP   in0=1'b1; in1=1'b1; in2=1'b1;
    #STEP   $finish;
end

initial $monitor( $stime, " in0=%b in1=%b in2=%b not=%b and2=%b and3=%b", in0, in1, in2, out_not, out_and2, out_and3);

endmodule

