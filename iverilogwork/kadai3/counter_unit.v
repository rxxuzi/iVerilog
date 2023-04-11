// 4bit binary counter by 1bit counter unit
module counter_unit( ck, res, q);
input     ck, res; 
output  [3:0] q; 
wire	[3:0] ca;

cnt_unit cu0( ck, res,  1'b1, q[0], ca[0]);
cnt_unit cu1( ck, res, ca[0], q[1], ca[1]);
cnt_unit cu2( ck, res, ca[1], q[2], ca[2]);
cnt_unit cu3( ck, res, ca[2], q[3], ca[3]);

endmodule
