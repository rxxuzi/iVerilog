`timescale 1ps/1ps

module rom_tp;
reg  [3:0] addr;
wire  [7:0] data;
parameter STEP = 100000;

rom rom(addr, data);

initial begin
	    addr=4'd0;
    #STEP   addr=4'd1; 
    #STEP   addr=4'd8; 
    #STEP   addr=4'd15;
    #STEP   addr=4'dx;
    #STEP   $finish;
end
initial $monitor($stime, " addr=%d data=%d ", addr, data);

endmodule

