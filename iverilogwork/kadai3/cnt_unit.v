// 1bit counter unit	
module cnt_unit( CK, RES, EN, Q, CA );
input     CK, RES, EN; 
output   Q, CA; 
reg        Q;
always @( posedge CK or posedge RES ) begin
    if ( RES==1'b1 ) 
        Q <= 1'b0;
    else if ( EN ==1'b1 )
        Q <= ~Q;
end
assign   CA = EN & Q;
endmodule
