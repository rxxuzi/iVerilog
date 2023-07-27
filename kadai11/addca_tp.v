`timescale 1ps/1ps

module addca_tp;
reg  [3:0] a,b;
reg cin;
wire  [3:0] q;
wire cout;

parameter STEP = 100000;

addca addca(a,b,cin,q,cout);

initial begin
	    a=4'h0; b=4'h0; cin=1'b0;
    #STEP   a=4'h0; b=4'h0; cin=1'b1;
    #STEP   a=4'h1; b=4'h1; cin=1'b0;
    #STEP   a=4'h1; b=4'h1; cin=1'b1;
    #STEP   a=4'hf; b=4'hf; cin=1'b0;
    #STEP   a=4'hf; b=4'hf; cin=1'b1;
    #STEP   $finish;
end
initial $monitor($stime, " a=%h b=%h cin=%b q=%h cout=%b", a,b,cin,q,cout);

endmodule

