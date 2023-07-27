/* �d�q���@
�Ïؔԍ���o�^�ł���悤�ɂ���D
����������secret_key��4�fb1111�ŏ�����
�Ïؔԍ����͂��S�������̎���close��������Ă�lock�ł��Ȃ��D
�N���[�Y�ł�������������M��close_enbl���쐬���āC�Ïؔԍ��o�^�ƃ��b�N�̂Q�����Ŏg�p����
*/

module elelock3( ck, reset, tenkey, close, lock);
input ck, reset, close;
input [9:0] tenkey;
output lock;
reg lock, ke1, ke2;
reg [3:0] key[0:3];
reg [3:0] secret_key[0:3];

wire match, key_enbl, lock_enbl;

// �Ïؔԍ����́E�L�����W�X�^
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
      secret_key[3] <= key[3];	// �Ïؔԍ��o�^�C4�������̓��͎���lock����Ă��鎞�͓o�^����Ȃ�
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

// �e���E�L�[���̓`���b�^���p
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

// �d�q���o��
always @( posedge ck or posedge reset ) begin
   if ( reset==1'b1 ) 
      lock <= 1'b0;
   else if ( close==1'b1 && lock_enbl==1'b1) begin
      lock <= 1'b1;
   end
   else if ( match==1'b1 )
      lock <= 1'b0;
end

// �e���E�L�[���̓G���R�[�_
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

// �Ïؔԍ���v�M��
assign match = (key[0]==secret_key[0]) && (key[1]==secret_key[1]) && (key[2]==secret_key[2]) && (key[3]==secret_key[3]);

assign key_enbl = ~ke2 & ke1;
assign lock_enbl= (lock==1'b0) && (key[3]!=4'b1111) && (key[2]!=4'b1111) && (key[1]!=4'b1111) && (key[0]!=4'b1111);

endmodule


      