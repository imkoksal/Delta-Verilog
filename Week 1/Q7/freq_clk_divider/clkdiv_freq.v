`timescale 1ns / 1ps

module clkdiv_freq(
    input clk,
    input [1:0] freq,
    output divided_clk
    );
    reg div_clk;
    reg [3:0]clk_counter;
    
    initial begin
    div_clk=0;
    clk_counter=0;
    end
    
    always@(posedge clk)begin
    clk_counter=clk_counter +1;
    
    case(freq)
        //normal clk
        2'b00:div_clk=clk_counter[0];
        //divide by 2
        2'b01:div_clk=clk_counter[1];
        //divide by 4
        2'b10:div_clk=clk_counter[2];
        //divide by 8
        2'b11:div_clk=clk_counter[3];
        
        default:div_clk=0;   
    endcase
    
    end
    assign divided_clk=div_clk;
    
endmodule
