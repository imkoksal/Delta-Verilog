`timescale 1ns / 1ps

module D_flipflop(

    input clk,
    input rst,
    input d,
    output reg q
    );
initial begin
q=0;
end

always @ (posedge clk or posedge rst)begin
    if (rst == 1)begin
        q <= 1'b0;
    end else begin
        q <= d;
	end
end

endmodule