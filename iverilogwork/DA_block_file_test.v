// D-A変換シミュレーション・モデル

module DA_block;

integer i, mcd;

initial begin

mcd=$fopen("DA_out.dat");
for ( i=0; i<10; i=i+1)
	$fdisplay(mcd, "%d",i);


$fclose(mcd);

end

endmodule
