`timescale 1ns/1ps

module top_module_tb();

    // Instantiate the module under test
    top_module uut (
        .clk(clk),
        .resetn(resetn),
        .byteena(byteena),
        .d(d),
        .q(q)
    );

    // Define the signals for the module inputs and outputs
    reg clk;
    reg resetn;
    reg [1:0] byteena;
    reg [15:0] d;
    wire [15:0] q;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        resetn = 1;
        byteena = 2'b00;
        d = 16'hABCD;

        // Apply reset
        #10;
        resetn = 0;
        #10;
        resetn = 1;

        // Test case 1: Enable both bytes
        byteena = 2'b11;
        d = 16'h1234;
        #10;
        $display("Test case 1: q=%h", q);

        // Test case 2: Enable only the high byte
        byteena = 2'b10;
        d = 16'h5678;
        #10;
        $display("Test case 2: q=%h", q);

        // Test case 3: Enable only the low byte
        byteena = 2'b01;
        d = 16'h9ABC;
        #10;
        $display("Test case 3: q=%h", q);

        // Add more test cases as needed

        $finish; // End simulation
    end

endmodule
