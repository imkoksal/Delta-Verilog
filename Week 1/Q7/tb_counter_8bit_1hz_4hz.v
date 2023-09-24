`timescale 1ns / 1ps

module tb_counter_8bit;

    reg clk;
    wire clk_1hz;
    wire clk_4hz;

    // Instantiate the counter_8bit module
    counter_8bit uut (
        .clk(clk),
        .clk_1hz(clk_1hz),
        .clk_4hz(clk_4hz)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    // Apply stimulus
    initial begin
    #2000000000
        $finish;  // Stop simulation after 20 iterations
    end

endmodule
