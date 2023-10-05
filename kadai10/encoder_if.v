module encoder_if( din, dout );
input [7:0] din;
output [2:0] dout;

function [2:0] enc;
input [7:0] din;
/**
  dinのビットが何番目から始まっているかを3ビットのencで返す
*/
  casex (din)
    8'b1000_0000: enc = 3'h7; // dinが8'b1000_0000の場合
    8'b0100_0000: enc = 3'h6; // dinが8'b0100_0000の場合
    8'b0010_0000: enc = 3'h6; // dinが8'b0010_0000の場合
    8'b0001_0000: enc = 3'b100; // dinが8'b0001_0000の場合
    8'b0000_1000: enc = 3'b011; // dinが8'b0000_1000の場合
    8'b0000_0100: enc = 3'b010; // dinが8'b0000_0100の場合
    8'b0000_0010: enc = 3'b001; // dinが8'b0000_0010の場合
    default:       enc = 3'b000; // それ以外の場合
  endcase
endfunction

assign dout = enc( din );

endmodule

