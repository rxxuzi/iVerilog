module Seri_Par_cat( ck, res, en, si, q);
input ck, res, en, si;
output [3:0] q;
reg [3:0] q;

always @( posedge ck ) begin
    if ( res )
        q <= 4'h0;
    else if ( en )
        q <= { q, si };
end 
endmodule
