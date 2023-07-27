`timescale 1ps/1ps

module COMP_EQ_tp;
reg  a,b;
wire  a_eq_b;
parameter STEP = 100000;

COMP_EQ COMP_EQ(a,b,a_eq_b);

initial begin
	    a=1'b0; b=1'b0;
    #STEP   a=1'b0; b=1'b1;
    #STEP   a=1'b1; b=1'b0;
    #STEP   a=1'b1; b=1'b1;
    #STEP   a=1'b0; b=1'b0;
    #STEP   $finish;
end
initial $monitor($stime, " a=%h b=%h a_eq_b=%h", a,b,a_eq_b);

endmodule

