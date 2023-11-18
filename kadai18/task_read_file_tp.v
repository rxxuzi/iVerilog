
// タスクのシミュレーション
module task_read_file_tp;

reg [7:0] infile[0:10];

integer i;


task read_file;
input [80*8:1] filename;

$readmemh(filename, infile);
endtask


initial begin
	read_file("sample.txt");
	for(i=0; i<10; i=i+1) 
        #10000  $display(infile[i]);

        #10000   $finish;
end

endmodule
