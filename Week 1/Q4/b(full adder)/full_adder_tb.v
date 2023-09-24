`timescale 1ns/1ps

module full_adder_tb;

    // Inputs
    reg a, b, cin;
    
    // Outputs
    wire sum, cout;

    // Instantiate the full_adder module (assuming it's defined elsewhere)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus
    initial begin

        // Initialize inputs
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;

        // Apply some test cases
        #10
         a = 1'b0; 
         b = 1'b0; 
         cin = 1'b0;  // Test case 1
        #10
         a = 1'b0; 
         b = 1'b0; 
         cin = 1'b1;  // Test case 2
        #10 
        a = 1'b0; 
        b = 1'b1; 
        cin = 1'b0;  // Test case 3
        #10 
        a = 1'b0; b = 1'b1; cin = 1'b1;  // Test case 4
        #10
         a = 1'b1; b = 1'b0; cin = 1'b0;  // Test case 5
        #10
         a = 1'b1; b = 1'b0; cin = 1'b1;  // Test case 6
        #10
         a = 1'b1; b = 1'b1; cin = 1'b0;  // Test case 7
        #10
         a = 1'b1; b = 1'b1; cin = 1'b1;  // Test case 8

        // Add additional test cases as needed

        // End simulation
        $finish;
    end

endmodule
