// デコード方式ステート・マシン
module state_dec( ck, sysreset, SW1, SW2, SW3, sec_reset, min_inc, hour_inc, sec_onoff, min_onoff, hour_onoff);
input ck, sysreset, SW1, SW2, SW3;
output  sec_reset, min_inc, hour_inc;
output  sec_onoff, min_onoff, hour_onoff;
reg  [1:0] cur;
reg  [1:0] nxt;

parameter  NORMAL=2'b00, SEC=2'b01, MIN=2'b10, HOUR=2'b11;

always @ (posedge ck or posedge sysreset ) begin
    if  ( sysreset ) 
	cur <= NORMAL;
    else 
	cur <= nxt;
end

always @ ( cur or SW1 or SW2 or SW3 ) begin
    case ( cur )
        NORMAL: if ( SW2 ) 
			nxt<= SEC;
                else nxt <= NORMAL;

        SEC:    if ( SW2 ) 
			nxt <= NORMAL;
                else if  ( SW3 ) 
			nxt <=HOUR;
                else 
			nxt <= SEC;
        HOUR:   if ( SW2 ) 
			nxt <= NORMAL;
                else if  ( SW3 ) 
			nxt <= MIN;
                else 
			nxt <= HOUR;
        MIN:    if ( SW2 ) 
			nxt <= NORMAL;
                else if  ( SW3 ) 
			nxt <= SEC;
                else 
			nxt <= MIN;
       default: nxt <= 2'bxx;
    endcase
end

assign sec_reset  = ( cur==SEC )  & SW1;
assign min_inc    = ( cur==MIN )  & SW1;
assign hour_inc   = ( cur==HOUR ) & SW1;
assign sec_onoff  = ( cur==SEC );
assign min_onoff  = ( cur==MIN );
assign hour_onoff = ( cur==HOUR );

endmodule
