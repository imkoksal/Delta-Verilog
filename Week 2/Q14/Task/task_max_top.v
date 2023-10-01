`timescale 1ns / 1ps

module task_max_top(
    input [7:0] num1,
    input [7:0] num2,
    output result
    );
    wire greater;
    
    task_max inst(
        .num1(num1),
        .num2(num2),
        .greater(greater)
    );
assign result=greater;
    
     
endmodule
