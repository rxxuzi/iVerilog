// 4 bit adder
module adder( a, b, q );
input [3:0] a,b;
output	[3:0]	q;

assign	q = a +  b;

endmodule