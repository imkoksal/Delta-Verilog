`timescale 1ns / 1ps


module counter_8bit(
    input clk,
    output clk_1hz,
    output clk_4hz
    );
    
    reg [31:0] clk_counter1hz;
    reg [31:0] clk_counter4hz;
    reg counter_1hz;
    reg counter_4hz;
    
    initial begin
        clk_counter1hz=0;
        clk_counter4hz=0;
        counter_1hz=0;
        counter_4hz=0;
    end
    
    always@(posedge clk) begin
        clk_counter1hz= clk_counter1hz+1;
        clk_counter4hz= clk_counter4hz+1;

        if (clk_counter1hz==100000000)begin
            clk_counter1hz=0;
            counter_1hz=counter_1hz+1;
        end
    
         if (clk_counter4hz==25000000)begin
            clk_counter4hz=0;
            counter_4hz=counter_4hz+1;
        end
       
    end
    assign clk_1hz=counter_1hz;
    assign clk_4hz=counter_4hz;
    
    
endmodule
