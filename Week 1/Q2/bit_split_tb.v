`timescale 1ns/1ps

module bit_split_tb();

    // Instantiate the module under test
    bit_split uut (
        .vec(vec),
        .outv(outv),
        .o2(o2),
        .o1(o1),
        .o0(o0)
    );

    // Define the signals for the module inputs and outputs
    reg [2:0] vec;
    wire [2:0] outv;
    wire o2, o1, o0;

    initial begin

        // Initialize inputs
        vec = 3'b101;
		#10;

        vec = 3'b010;
 		#10;

        vec = 3'b111;
  		#10;

        $finish; // End simulation
    end
  
    end

endmodule
