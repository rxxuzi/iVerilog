// full adder
module fulladd( A, B, CIN,  Q,  COUT );
input     A, B, CIN;
output   Q, COUT;
assign   Q = A ^ B ^ CIN;
assign   COUT = ( A & B ) | ( B & CIN ) | ( CIN & A ) ;
endmodule