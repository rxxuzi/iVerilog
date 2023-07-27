`timescale 1ps/1ps

module sel4to1_if_tp;
reg [3:0] din;
reg [1:0] sel;
wire dout;

parameter STEP = 1000;

sel4to1_if sel4to1_if(din, sel, dout);

initial begin
            sel[1]=1'b0; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b0; din[1]=1'b0; din[0]=1'b1;
    #STEP   sel[1]=1'b0; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b0; din[1]=1'b0; din[0]=1'b1;
    #STEP   sel[1]=1'b1; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b0; din[1]=1'b0; din[0]=1'b1;
    #STEP   sel[1]=1'b1; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b0; din[1]=1'b0; din[0]=1'b1;

    #STEP   sel[1]=1'b0; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b0; din[1]=1'b1; din[0]=1'b0;
    #STEP   sel[1]=1'b0; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b0; din[1]=1'b1; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b0; din[1]=1'b1; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b0; din[1]=1'b1; din[0]=1'b0;

    #STEP   sel[1]=1'b0; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b1; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b0; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b1; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b1; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b1; din[3]=1'b0; din[2]=1'b1; din[1]=1'b0; din[0]=1'b0;

    #STEP   sel[1]=1'b0; sel[0]=1'b0; din[3]=1'b1; din[2]=1'b0; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b0; sel[0]=1'b1; din[3]=1'b1; din[2]=1'b0; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b0; din[3]=1'b1; din[2]=1'b0; din[1]=1'b0; din[0]=1'b0;
    #STEP   sel[1]=1'b1; sel[0]=1'b1; din[3]=1'b1; din[2]=1'b0; din[1]=1'b0; din[0]=1'b0;

    #STEP   $finish;
end

initial $monitor( $stime, " sel=%h din=%b dout=%b ", sel, din, dout);

endmodule

