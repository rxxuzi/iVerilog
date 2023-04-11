// ワン・ホット方式ステートマシン
module state_onehot( ck, sysreset, SW1, SW2, SW3, sec_reset, min_inc, hour_inc, sec_onoff, min_onoff, hour_onoff);
input     ck, sysreset, SW1, SW2, SW3;
output   sec_reset, min_inc, hour_inc;
output   sec_onoff, min_onoff, hour_onoff;
reg [3:0]  cur;
reg [3:0]  nxt;

parameter  NORMAL=4'b0001, SEC=4'b0010, MIN=4'b0100, HOUR=4'b1000;

parameter  POS_NORM=2'h0, POS_SEC=2'h1, POS_MIN=2'h2, POS_HOUR=2'h3;

always@( posedge ck or posedge sysreset ) begin
  if (sysreset)
    cur <= NORMAL;
  else 
    cur <= nxt;
end

always @( cur or SW1 or SW2 or SW3 ) begin
  case ( cur )
    NORMAL: if (SW2)  
		nxt <= SEC;
            else  
		nxt <= NORMAL;
    SEC:    if (SW2)  
		nxt <= NORMAL;
            else if (SW3) 
		nxt <= HOUR;
            else  
		nxt <= SEC;
    HOUR:   if (SW2) 
		nxt <= NORMAL;
            else if (SW3)  
		nxt <= MIN;
            else  
		nxt <= HOUR;
    MIN:    if (SW2)  
		nxt <= NORMAL;
            else if (SW3)  
		nxt <= SEC;
            else  
		nxt <= MIN;
    default: nxt <= NORMAL;
  endcase
end

assign sec_reset  = cur[POS_SEC] & SW1;
assign min_inc    = cur[POS_MIN] & SW1;
assign hour_inc   = cur[POS_HOUR] & SW1;
assign sec_onoff  = cur[POS_SEC];
assign min_onoff  = cur[POS_MIN];
assign hour_onoff = cur[POS_HOUR];

endmodule