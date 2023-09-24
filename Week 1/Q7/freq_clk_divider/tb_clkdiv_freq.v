`timescale 1ns / 1ps

module tb_clkdiv_freq;

    // Inputs
    reg clk;
    reg [1:0] freq;
    
    // Outputs
    wire divided_clk;

    // Instantiate the module
    clkdiv_freq uut (
        .clk(clk),
        .freq(freq),
        .divided_clk(divided_clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle the clock every 5 time units
    end

    // Apply stimulus
    initial begin
        // Initialize inputs
        freq = 2'b00;  // normal clk

        // Apply inputs and observe outputs
        repeat (10) begin
            #20;  // Wait for 10 time units

            freq = freq + 1;
            if (freq > 2'b11)
                freq = 2'b00;
        end

        $finish;
    end

endmodule
