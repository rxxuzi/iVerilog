module regfile( ck, we, din, inaddr, dout, outaddr );
input ck, we;
input [7:0] din;
input [1:0] inaddr, outaddr;
output [7:0] dout;
reg [7:0] file [0:3]; 

always @( posedge ck ) 
    if ( we )
        file[inaddr] <= din;

assign dout = file[outaddr];

endmodule
