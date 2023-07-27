module rom( addr, data );
input [3:0]  addr;
output [7:0] data;

function [7:0] romout;
input [3:0] addr;
  case ( addr )
     4'd0 : romout = 8'd0;
     4'd1 : romout = 8'd1;
     4'd2 : romout = 8'd4;
     4'd3 : romout = 8'd9;
     4'd4 : romout = 8'd16;
     4'd5 : romout = 8'd25;
     4'd6 : romout = 8'd36;
     4'd7 : romout = 8'd49;
     4'd8 : romout = 8'd64;
     4'd9 : romout = 8'd81;
     4'd10: romout = 8'd100;
     4'd11: romout = 8'd121;
     4'd12: romout = 8'd144;
     4'd13: romout = 8'd169;
     4'd14: romout = 8'd196;
     4'd15: romout = 8'd225;
   default: romout = 8'hxx;
   endcase
endfunction

assign data = romout( addr );

endmodule
