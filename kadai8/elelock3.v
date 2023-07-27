/* 電子錠　
暗証番号を登録できるようにする．
初期化時はsecret_keyも4’b1111で初期化
暗証番号入力が４桁未満の時にcloseを押されてもlockできない．
クローズできる条件を示す信号close_enblを作成して，暗証番号登録とロックの２か所で使用する
*/

module elelock3( ck, reset, tenkey, close, lock);
input ck, reset, close;
input [9:0] tenkey;
output lock;
reg lock, ke1, ke2;
reg [3:0] key[0:3];
reg [3:0] secret_key[0:3];

wire match, key_enbl, lock_enbl;

// 暗証番号入力・記憶レジスタ
always @( posedge ck or posedge reset ) begin
   if ( reset==1'b1 ) begin
      secret_key[3] <= 4'b1111;	
      secret_key[2] <= 4'b1111;
      secret_key[1] <= 4'b1111;
      secret_key[0] <= 4'b1111;
      key[3] <= 4'b1111;
      key[2] <= 4'b1111;
      key[1] <= 4'b1111;
      key[0] <= 4'b1111;
   end
   else if ( close==1'b1 && lock_enbl==1'b1) begin 
      secret_key[3] <= key[3];	// 暗証番号登録，4桁未満の入力時とlockされている時は登録されない
      secret_key[2] <= key[2];
      secret_key[1] <= key[1];
      secret_key[0] <= key[0];
      key[3] <= 4'b1111;
      key[2] <= 4'b1111;
      key[1] <= 4'b1111;
      key[0] <= 4'b1111;
   end
   else if ( key_enbl==1'b1 ) begin
      key[3] <= key[2];
      key[2] <= key[1];
      key[1] <= key[0];
      key[0] <= keyenc( tenkey ); 
   end
end

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

// 電子錠出力
always @( posedge ck or posedge reset ) begin
   if ( reset==1'b1 ) 
      lock <= 1'b0;
   else if ( close==1'b1 && lock_enbl==1'b1) begin
      lock <= 1'b1;
   end
   else if ( match==1'b1 )
      lock <= 1'b0;
end

// テン・キー入力エンコーダ
function [3:0] keyenc;
input [9:0] sw;
   case ( sw )
      10'b00000_00001: keyenc = 4'h0;
      10'b00000_00010: keyenc = 4'h1;
      10'b00000_00100: keyenc = 4'h2;
      10'b00000_01000: keyenc = 4'h3;
      10'b00000_10000: keyenc = 4'h4;
      10'b00001_00000: keyenc = 4'h5;
      10'b00010_00000: keyenc = 4'h6;
      10'b00100_00000: keyenc = 4'h7;
      10'b01000_00000: keyenc = 4'h8;
      10'b10000_00000: keyenc = 4'h9;
   endcase
endfunction

// 暗証番号一致信号
assign match = (key[0]==secret_key[0]) && (key[1]==secret_key[1]) && (key[2]==secret_key[2]) && (key[3]==secret_key[3]);

assign key_enbl = ~ke2 & ke1;
assign lock_enbl= (lock==1'b0) && (key[3]!=4'b1111) && (key[2]!=4'b1111) && (key[1]!=4'b1111) && (key[0]!=4'b1111);

endmodule


      