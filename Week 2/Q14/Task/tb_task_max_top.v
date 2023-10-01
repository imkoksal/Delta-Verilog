`timescale 1ns / 1ps

module tb_task_max_top();
    reg [7:0] number1; 
    reg [7:0] number2;
    wire result;
    
    task_max_top uut(
        .num1(number1),
        .num2(number2),
        .result(result)
    );

    
    initial begin
        number1 = 10;
        number2 = 20;
        #20;
        
        number1 = 20;
        number2 = 20;
        #20;
        
        number1 = 30;
        number2 = 20;
        #20; 
        
        $finish;
    end
    
endmodule