`timescale 1ns/1ps

module d_latch_tb();

    // Instantiate the module under test
    d_latch uut (
        .d(d),
        .byteena(byteena),
        .q(q)
    );

    // Define the signals for the module inputs and outputs
    reg d;
    reg [1:0] byteena;
    reg [15:0] q;

    // Stimulus generation
    initial begin
        // Initialize inputs
        d = 8'b10101010;  // Example data input
        byteena = 2'b11;  // Enable all bits

        // Apply some delay
        #10;

        // Enable only lower byte
        byteena = 2'b01;
        // Wait for a few cycles to observe the change
        #10;

        // Enable only upper byte
        byteena = 2'b10;
        // Wait for a few cycles to observe the change
        #10;

        // Enable all bits again
        byteena = 2'b11;
        // Wait for a few cycles to observe the change
        #10;

        $finish; // End simulation
    end

    // Monitor the output
    always @(posedge byteena) begin
        $display("q = %h", q);
    end

endmodule
