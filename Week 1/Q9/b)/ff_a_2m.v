`timescale 1ns / 1ps

module ff_a_2m(
input clk,
input sel1,
input sel2,
input r,
input q_in,
output reg q
    );

    always @ (posedge clk) begin
case(sel1)
    1'b0: begin
        case (sel2)
            1'b0 : q <= q;
            1'b1 : q <= r;
        endcase
  end
  
  1'b1:begin
    case (sel2)
        1'b0 : q <= q_in;
        1'b1 : q <= r;
    endcase
    
  end
  
  endcase
    end


endmodule
