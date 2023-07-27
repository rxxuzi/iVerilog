module COMP_EQ(a,b,a_eq_b);
input a,b;
output a_eq_b;
//比較回路
//true なら1をfalseなら0を
// assign a_eq_b= (a==b);

//乗算回路
assign a_eq_b = a * b;

//バレルシフト
// assign a_eq_b = a << b;
endmodule

