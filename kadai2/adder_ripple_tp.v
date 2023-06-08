`timescale 1ps/1ps

module adder_ripple_tp;
reg  [3:0] a,b;
wire  [3:0] q;
parameter STEP = 100000;

adder_ripple adder_ripple(a,b,q);

initial begin
    $dumpfile( "adder_ripple_tp.vcd");
    $dumpvars(0,adder_ripple_tp); 
	    a=4'h0; b=4'h0;
    #STEP   a=4'h0; b=4'h1;
    #STEP   a=4'h1; b=4'h1;
    #STEP   a=4'h1; b=4'h2;
    #STEP   a=4'hf;  b=4'hf;
    #STEP   $finish;
end
initial $monitor($stime, " a=%h b=%h q=%h", a,b,q);

endmodule