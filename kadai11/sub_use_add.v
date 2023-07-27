module sub_use_add(a,b,q);
input [3:0] a,b;
output [3:0] q;
wire dummy;

addca sub(a, ~b, 1'b1, q, dummy);
//減算回路
assign b_comp =  ~b + 1; // bの1の補数を計算


endmodule

