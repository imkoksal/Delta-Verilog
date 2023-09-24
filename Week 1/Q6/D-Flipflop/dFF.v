`timescale 1ns/1ps

module top_module(
    input clk,
    input resetn,  // Synchronous active low reset (if value == 0, reset)
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    reg [15:0]q_out;
    
    always @(posedge clk) begin
        if (!resetn) begin
            q_out <= 16'd0;
        end
        else begin
            if (byteena[0] == 0)
                q_out[7:0] = 8'd0;
            else
                q_out[7:0] = d[7:0];

            if (byteena[1] == 0)
                q_out[15:8] = 8'd0;
            else
                q_out[15:8] = d[15:8];
        end
    end
   assign q=q_out;
endmodule
