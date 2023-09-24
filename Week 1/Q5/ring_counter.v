`timescale 1ns/1ps

module ring_counter #(parameter N = 4)(
    input clk,
    output [N-1:0] ring_out
    );

  reg [N-1:0] reg_ring=4'b1000;
  
    always @(posedge clk) begin
        // kaydırma işlemi
        
        if (reg_ring[0] == 1) begin
            reg_ring[N-1] <= 1;
        end
	reg_ring = reg_ring >> 1;
    end 
   assign ring_out = reg_ring;
    
endmodule