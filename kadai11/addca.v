module addca(a,b,cin,q, cout);
input [3:0] a,b;
input cin;
output [3:0] q;
output cout;

assign {cout,q}=a+b+cin;

endmodule

