module inpattern_tp;

reg [1:0] ADDR;
reg [7:0] DIN;
reg REB, WEB;
reg [11:0] pat, pattern[0:3];
integer i;

parameter STEP = 1000;

initial begin
    $readmemb("inpattern.dat", pattern);
    ADDR=0; DIN=0; REB=0; WEB=0;
    for( i=0; i<4; i=i+1) begin
        pat=pattern[i];
        #STEP  ADDR=pat[11:10];
               DIN=pat[9:2];
               REB=pat[1];
               WEB=pat[0];
    end
    #STEP   $finish;
end

initial $monitor( $stime, " ADDR=%h DIN=%h REB=%b WEB=%b ", ADDR, DIN, REB, WEB); 

endmodule


/*
出力方法を色々変えてみた

initial begin
 forever begin
    $display( $stime, " ADDR=%h DIN=%h REB=%b WEB=%b ", ADDR, DIN, REB, WEB);
    #STEP ; 
 end
end

initial begin
 repeat (3) begin
    $display( $stime, " ADDR=%h DIN=%h REB=%b WEB=%b ", ADDR, DIN, REB, WEB);
    #STEP ; 
 end
end

always #STEP $display( $stime, " ADDR=%h DIN=%h REB=%b WEB=%b ", ADDR, DIN, REB, WEB); 

*/
