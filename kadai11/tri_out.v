module tri_out(enable, bus, DOUT);
input enable;
input [7:0] bus;
output [7:0]  DOUT;

assign DOUT = (enable)? bus: 8'hzz;

endmodule
