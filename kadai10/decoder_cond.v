module decoder_cond(din, dout);
input [1:0] din;
output [3:0] dout;

assign dout[0] = ( din==2'b00 );
assign dout[1] = ( din==2'b01 );
assign dout[2] = ( din==2'b10 );
assign dout[3] = ( din==2'b11 );

endmodule

