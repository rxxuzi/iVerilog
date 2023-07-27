module DLATCH(G, D, Q);
input G, D;
output Q;
reg Q;

always @(G or D)
    if (G)
  Q<=D;

endmodule
