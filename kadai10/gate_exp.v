module gate_exp(in0, in1, in2, out_not, out_and2, out_and3);
input in0, in1, in2; 
output out_not, out_and2, out_and3;

// 1 input
assign out_not = ~in0;

// 2 input
assign out_and2 = in0 & in1;

// 3 input
assign out_and3 = in0 & in1 & in2;

endmodule

