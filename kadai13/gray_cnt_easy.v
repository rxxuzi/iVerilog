`timescale 1ns/1ps
module gray_cnt_easy(ck, res, q);
    input ck, res;
    output [2:0] q;
    reg [3:0] r;

    always @(posedge ck or posedge res) begin
        if (res)
            r <= 4'b0000; // Reset condition
        else
            r <= {~r[3], r[3:1]}; // Shift and invert highest bit
    end

    assign q = r;
endmodule


