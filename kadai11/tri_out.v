module tri_out(enable, bus, DOUT);
input enable;
input [7:0] bus;
output [7:0]  DOUT;
wire [7:0] dbus;
//3ステートパス
// assign dbus = (enable1) ? bus1 : 8'hzz;
// assign dbus = (enable2) ? bus1 : 8'hzz;
// assign dbus = (enable3) ? bus1 : 8'hzz;

//3ステート出力
assign DOUT = (enable) ? bus : 8'hzz;

endmodule
