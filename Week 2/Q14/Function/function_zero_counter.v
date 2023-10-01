`timescale 1ns / 1ps

module Q14_function(
input clk,
input [7:0] num,
output reg [3:0] out
    );
    always@(posedge clk) begin
	out=zero_counter(num);
    end
   
    function [3:0] zero_counter(input [7:0] num);
        reg [3:0] counter;//local variable
        integer i;
        begin
        counter=0;
		//zero counter
        for(i=0;i<8;i=i+1)begin
            if(num[i]==0)
                counter=counter+1;
        end
        zero_counter=counter;
        end
    endfunction

endmodule
