module Par_Seri( ck, en, ld, pi, so );
input ck, en, ld;
input [3:0] pi;
output so;
reg [3:0] ps;

always @( posedge ck ) begin
    if ( ld )
        ps <= pi;
    else if ( en )
        ps <= ps <<1;
end 

assign so = ps[3];

endmodule
