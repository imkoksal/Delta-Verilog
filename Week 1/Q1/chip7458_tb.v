`timescale 1ns / 1ps


module chip7458_tb();

    // Instantiate the module under test
    chip7458 uut (
        .p1a(p1a),
        .p1b(p1b),
        .p1c(p1c),
        .p1d(p1d),
        .p1e(p1e),
        .p1f(p1f),
        .p2a(p2a),
        .p2b(p2b),
        .p2c(p2c),
        .p2d(p2d),
        .p1y(p1y),
        .p2y(p2y)
    );

    // Define the signals for the module inputs and outputs
    reg p1a, p1b, p1c, p1d, p1e, p1f;
    wire p1y;
    reg p2a, p2b, p2c, p2d;
    wire p2y;

    // Stimulus generation
    initial begin
        // Initialize inputs
        p1a = 0; p1b = 0; p1c = 0;
        p1d = 0; p1e = 0; p1f = 0;
        p2a = 0; p2b = 0;
        p2c = 0; p2d = 0;

        #10; 


        p1a = 1; p1b = 1; p1c = 1;
        p1d = 1; p1e = 1; p1f = 1;
        p2a = 1; p2b = 1;
        p2c = 1; p2d = 1;
        
        #10; 

        // Test case 3
        p1a = 1; p1b = 0; p1c = 1;
        p1d = 0; p1e = 1; p1f = 0;
        p2a = 1; p2b = 0;
        p2c = 0; p2d = 1;
        #10; 
    
        

        $finish; // End simulation
    end

 
endmodule