// RAMシミュレーション

module RAM( addr, data, ceb, web, oeb);
input [14:0] addr;
inout [7:0] data;
input ceb, web, oeb;

reg [7:0] mem [0:32767];
wire  WRITE, READ;

parameter WDELAY = 1000, RDELAY = 1500;

always @( WRITE or data ) begin
	#WDELAY
	if (WRITE)
		mem[addr] <= data;
end

assign READ  = (oeb==0) & (ceb==0);
assign WRITE = (web==0) & (ceb==0);

assign #RDELAY data = READ ? mem[addr] : 8'hzz;

endmodule
