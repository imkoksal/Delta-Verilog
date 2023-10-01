`timescale 1ns / 1ps

module m_a_ff(
input clk,
input sel,
input r,
input q_in,
output reg q
    );

    always @ (posedge clk) begin
        case (sel)
            1'b0 : q <= q_in;
            1'b1 : q <= r;
        endcase    
    end


endmodule
