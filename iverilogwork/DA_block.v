// D-A変換シミュレーション・モデル

module DA_block( dack, reset, we, din );
input dack, reset, we;
input [7:0] din;

parameter LINENUM = 910;
reg [9:0] addr;
reg [7:0] mem[0:LINENUM-1];
reg outflag;
integer i, mcd;

always @( posedge dack ) begin
	if ( reset )
		addr <= 0;
	else if ( we ) begin 
		mem[addr] <= din;
		addr <= addr + 1;
	end
end

initial begin
	outflag = 0;
	wait( outflag );
	mcd=$fopen("DA_out.txt");
	for ( i=0; i<LINENUM; i=i+1 )
		$fdisplay(mcd, "%d", mem[i] );
	
	$fclose(mcd);
end

endmodule
