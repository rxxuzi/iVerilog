
// タスクのシミュレーション
module task_tp;

reg A,B;
wire C;

task test;
input a,b;
begin 
    #100 A=a;
    #100 B=b;
end
endtask

gand gand(A,B,C); 

initial begin
	test(0,0);
#10000   test(0,1);
#10000   test(1,0);
#10000   test(1,1);
#10000   $finish;
end

initial $monitor( $stime, " A=%b B=%b C=%b ", A,B,C); 

endmodule
