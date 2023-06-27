/* 電子錠　*/

module keyenable( ck, reset, tenkey);
input ck, reset;
input [9:0] tenkey;

reg ke1, ke2;
wire key_enbl;

// テン・キー入力チャッタ取り用
always @( posedge ck or posedge reset ) begin
   if ( reset==1'b1 ) begin
      ke2 <= 1'b0;
      ke1 <= 1'b0;
   end
   else begin
      ke2 <= ke1;
      ke1 <= | tenkey;
   end
end  

assign key_enbl = ~ke2 & ke1;

endmodule
 