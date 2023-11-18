// ROMシミュレーション

module ROM( addr, data, oeb);
input [14:0] addr;
inout [7:0] data;
input oeb;

reg [7:0] mem [0:32767];

parameter RDELAY = 1500;

assign #RDELAY data = (oeb==0) ? mem[addr] : 8'hzz;

initial $readmemh( "rom_data.hex", mem );

endmodule
