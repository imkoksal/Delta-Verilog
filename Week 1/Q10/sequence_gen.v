`timescale 1ns / 1ps


module sequence_gen(
    input clk,
    input rst,
    output [15:0]seq_o
    );
    
    reg [15:0]seq0;
    reg [15:0]seq1;
    reg[15:0] seq2;
    

    initial begin
    seq0=0;
    seq1=1;
    seq2=1;
    end
    
    always@(posedge clk or posedge rst)begin
        if(rst==1)begin
        seq0=0;
        seq1=1;
        seq2=1;  
        end
         else begin
         seq1<=seq2;
         seq0<=seq1;
         seq2=seq1+seq0;
         end         
    end
    assign seq_o=seq2;
endmodule
