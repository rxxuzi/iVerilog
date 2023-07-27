`timescale 1ps/1ps

module sub_use_add_tp;
reg  [3:0] a,b;
wire  [3:0] q;
parameter STEP = 100000;

sub_use_add sub_use_add(a,b,q);

initial begin
	    a=4'h0; b=4'h0;
    #STEP   a=4'h1; b=4'h0;
    #STEP   a=4'h0; b=4'h1;
    #STEP   a=4'hf; b=4'he;
    #STEP   a=4'he;  b=4'hf;
    #STEP   $finish;
end
initial $monitor($stime, " a=%h b=%h q=%h", a,b,q);

endmodule

