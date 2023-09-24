`timescale 1ns/1ps

module d_latch (
    input d,
    input [1:0] byteena,
    output reg [15:0]q
);
    always @(*) begin
        q = d;
        if (byteena[0] == 0)
            q[7:0] = 8'd0;
        if (byteena[1] == 0)
            q[15:8] = 8'b0;
    end
endmodule
