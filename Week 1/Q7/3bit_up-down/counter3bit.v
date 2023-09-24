`timescale 1ns/1ps

module counter3bit(
  	input clk,
	input reset,
  output [2:0] counter

);
  reg [2:0]counter_reg;
  reg count_direction;
  
  initial begin 
    counter_reg=1;
    count_direction=0;
  end
  
  
  always@(posedge clk) begin
    if(reset)begin
      counter_reg=0;
    	end
  	else begin
  	//change directions when at edge value
      if(counter_reg==0 | counter_reg==7)begin
        count_direction=~count_direction;
      end
      //making the sequence
      if (count_direction==0)begin
      	counter_reg=counter_reg+1;
      end
      else begin
        counter_reg=counter_reg-1;
      end
    end
  
  end
  assign counter= counter_reg;

endmodule