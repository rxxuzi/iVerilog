module sel4to1_if(din, sel, dout);
input [3:0] din;
input [1:0] sel;
output dout;

function select;
input [3:0] din;
input [1:0] sel;

  if (sel==2'h0)      select=din[0];
  else if (sel==2'h1) select=din[1];
  else if (sel==2'h2) select=din[2];
  else                select=din[3];

/*
begin
  if (sel==2'h0) select=din[0];
  if (sel==2'h1) select=din[1];
  if (sel==2'h2) select=din[2];
  if (sel==2'h3) select=din[3];
end
*/

endfunction

assign dout=select(din,sel);

endmodule

