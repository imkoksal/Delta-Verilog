`timescale 1ns / 1ps

module task_max(
input [7:0] num1,
input [7:0] num2,
output  greater
    );
  reg compare;
  
  always@(num1,num2)begin
      task_max(num1, num2,compare);
  end
  
    task task_max(input [7:0] num1,input [7:0] num2,output compare);
  
    begin
    if(num1>num2)
        compare=0;
    else
    compare=1;
   end

    endtask

    assign greater=compare;
        
endmodule
