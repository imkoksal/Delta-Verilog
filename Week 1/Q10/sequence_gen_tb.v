`timescale 1ns / 1ps

module tb_sequence_gen;

    reg clk;
    reg rst;
    wire [15:0]seq_o;

    // Instantiate the sequence_gen module
    sequence_gen uut (
        .clk(clk),
        .rst(rst),
        .seq_o(seq_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle the clock every 5 time units to simulate a clock
    end

    // Stimulus and reset
    initial begin
        // Initialize inputs
        rst = 0;

        // Reset sequence generator
        rst = 1;
        #10;
        rst = 0;

        // Apply inputs and observe outputs
        #100

        $finish;  // Stop simulation after 20 iterations
    end

endmodule
