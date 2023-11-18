
// タスクのシミュレーション
module task_read_file_tp;

`define FNAME

reg [7:0] infile[0:10];
integer i;

`ifdef FNAME
parameter [80*8:1] name="sample";
`else
parameter [80*8:1] name="sample2";
`endif

task read_file;
input [80*8:1] filename;

$readmemh(filename, infile,1,5);
endtask


initial begin
	read_file( {name,".txt"} );
	for(i=0; i<10; i=i+1) 
        #10000  $display(infile[i]);

        #10000   $finish;
end

endmodule
