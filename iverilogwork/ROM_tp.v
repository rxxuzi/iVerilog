// `timescale 1ps/1ps
// ディレイの記述を含むことでデフォルトのタイムスケールがセットされるようだ	
module ROM_tp;

reg [14:0] addr;
wire [7:0] data;
reg oeb;

parameter STEP = 10000;

ROM ROM( addr, data, oeb);


initial begin
            addr=0; oeb=1;	
    #STEP   addr=0; oeb=1;
    #STEP   addr=0; oeb=0;
    #STEP   addr=1; oeb=1;
    #STEP   addr=1; oeb=0;
    #STEP   addr=2; oeb=1;
    #STEP   addr=2; oeb=0;
    #STEP   addr=3; oeb=1;
    #STEP   addr=3; oeb=0;
    #STEP   $finish;
end

initial $monitor( $stime, " addr=%h oeb=%b data=%h ", addr, oeb, data); 

endmodule
