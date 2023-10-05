// 4 bit up/down counter
module updown_cnt( ck, res, down, q );
input	ck, res, down;
output   [3:0]  q; 
reg        [3:0] q;
always @( posedge ck ) begin
    if ( res )
        q <= 4'h0;
    else if ( down )
        q <= q - 4'h1;
    else 
        q <= q + 4'h1;
end
endmodule