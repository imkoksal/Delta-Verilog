`timescale 1ns/1ps

module JohnsonCounter(clk,rst,counter);
  input clk;
  input rst;
  output reg [3:0] counter;
  
  always@(posedge clk)begin
    if(rst==0)begin
      counter=4'b0000;
    end
    else begin
      //taking the least important bit,reversing its value and making it the most important bit
      counter[3:0]={~counter[0],counter[3:1]};
      end
  end
endmodule