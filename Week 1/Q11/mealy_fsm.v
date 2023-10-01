`timescale 1ns / 1ps

module mealy_fsm(
    input clk,
    input din,
    input rst,
    output reg d_out
    );
    
    reg [1:0] state;
    
    
    //"identifying" states to read the code better
    localparam s0=0;
    localparam s1=1;
    localparam s2=2;
    localparam s3=3;

    always@(posedge clk or posedge rst)begin
        if(rst)begin
            state<=s0;
            d_out<=0;
        end
        else begin
            case(state)
                s0:begin
                d_out<=0;
                if(din==1)
                    state<=s1;    
                else 
                    state<=s0;
                 end
                
                s1:begin
                d_out<=0;
                if(din==1)
                    state<=s1;
                else 
                    state<=s2;
                end
               
                s2:begin
                d_out<=0;
                if(din==0)
                    state<=s0;   
                else
                    state<=s3;
                end
                
                s3:begin
                
                if(din==0)begin
                    state<=s2;
					d_out<=0;
                end else
                    state<=s1;
					d_out<=1;
                end
    
            endcase
        end
    end    
   
    
endmodule
