// `timescale 1ps/1ps
// ディレイの記述を含むことでデフォルトのタイムスケールがセットされるようだ

module DA_block_tp;
reg dack, reset, we;
reg [7:0] din;
integer i;

parameter STEP = 10000;

DA_block DA_block( dack, reset, we, din );

task setdin;
input [7:0] j;     // iとしても可，区別するため別名にした
begin 
    din= j;
    #STEP;
end
endtask

always begin
	dack = 0 ; #(STEP/2);
	dack = 1 ; #(STEP/2);
end

initial begin
            reset=0; we=0; din=0;	
    #STEP   reset=1; we=0; din=0;
    #STEP   reset=0; we=0; din=0;
    #STEP   reset=0; we=1; din=1;
    #(STEP*5)
    #STEP   reset=0; we=1; din=2;
    #(STEP*5)
    #STEP   reset=0; we=1; din=3;
    #(STEP*5)
    
    for ( i=4; i<100; i=i+1 ) setdin(i);

    DA_block.outflag = 1; 
    #STEP   $finish;		// ファイル書き出しを制御した後にすぐfinishすると出力されない
end

initial $monitor( $stime, " din=%d ",din ); 

endmodule
