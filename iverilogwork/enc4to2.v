module enc4to2(din, dout);
input [3:0] din;
output [1:0] dout;

function [1:0] enc;
input [3:0] din;
	case (din)
		4'b0001: enc=2'b00;
		4'b0010: enc=2'b01;
		4'b0100: enc=2'b10;
		4'b1000: enc=2'b11;
		default: enc=2'b11;
	endcase
endfunction

assign dout = enc(din);

endmodule
