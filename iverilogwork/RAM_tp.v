// `timescale 1ps/1ps
// ディレイの記述を含むことでデフォルトのタイムスケールがセットされるようだ

module RAM_tp;

reg [14:0] addr;
reg [7:0]  dataW;
wire [7:0] data;
reg ceb, web, oeb;

parameter STEP = 10000;

RAM RAM( addr, data, ceb, web, oeb );

assign data = ~web? dataW: 8'hzz;

initial begin
            addr=0; ceb=1; web=1; oeb=1;	
    #STEP   addr=0; ceb=0; web=0; oeb=1; dataW=0;
    #STEP   addr=1; ceb=0; web=0; oeb=1; dataW=1;
    #STEP   addr=2; ceb=0; web=0; oeb=1; dataW=2;
    #STEP   addr=3; ceb=0; web=0; oeb=1; dataW=3;
    #STEP   addr=0; ceb=1; web=1; oeb=1;
    #STEP   addr=0; ceb=0; web=1; oeb=0;
    #STEP   addr=1; ceb=0; web=1; oeb=0;
    #STEP   addr=2; ceb=0; web=1; oeb=0;
    #STEP   addr=3; ceb=0; web=1; oeb=0;
    #STEP   $finish;
end

initial $monitor( $stime, " addr=%h ceb=%b web=%b oeb=%b data=%h ", addr, ceb, web, oeb, data); 

endmodule
