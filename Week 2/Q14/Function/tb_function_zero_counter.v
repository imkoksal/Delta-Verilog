`timescale 1ns/1ps

module tb_Q14_function();
    reg clk;
    reg [7:0] num;
    wire [3:0] out;

    Q14_function uut (
        .clk(clk),
        .num(num),
        .out(out)
    );

always #5 clk=~clk;

    initial begin
    clk=0;
        num = 8'd0;
        #10;

        num = 8'b11111111;
        #10;

        num = 8'b10101010;
        #10;

        num = 8'b01010101;
        #10;
        
        num = 8'b10000001;
        #10;

        $finish;
    end
endmodule