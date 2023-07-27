`timescale 1ps/1ps

module tri_out_tp;
reg enable;
reg  [7:0] bus;
wire  [7:0] DOUT;
parameter STEP = 100000;

tri_out tri_out(enable, bus, DOUT);

initial begin
	    enable=1'b0; bus=8'h00;
    #STEP   enable=1'b0; bus=8'hff; 
    #STEP   enable=1'b1; bus=8'h00; 
    #STEP   enable=1'b1; bus=8'hff;
    #STEP   $finish;
end
initial $monitor($stime, " enable=%b bus=%h DOUT=%h ", enable, bus, DOUT);

endmodule

