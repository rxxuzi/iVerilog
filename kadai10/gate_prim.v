module gate_prim(in0, in1, in2, out_not, out_and2, out_and3);
input in0, in1, in2; 
output out_not, out_and2, out_and3;

// 1 input
not n1(out_not, in0);

// 2 input
and an2(out_and2, in0, in1);

// 3 input
and an3(out_and3, in0, in1, in2);

endmodule

