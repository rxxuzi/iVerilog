module DFF_sync(CK, D, LD, Q, QB, RB, SB);
input CK, D, LD, RB, SB;
output Q, QB;
reg Q;

always @(posedge CK) begin
  if (RB==1'b0)
    Q <= 1'b0;
  else if (SB==1'b0)
    Q <= 1'b1;
  else if (LD)
    Q <= D;
end

assign QB = ~Q;

endmodule
