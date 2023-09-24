`timescale 1ns/1ps

module tb_hamming;

 
  // Inputs and Outputs
  reg [N-1:0] in1;
  reg [N-1:0] in2;
  wire [N-1:0] hamming;
  
  // Instantiate the module
  hamming uut (
    .in1(in1),
    .in2(in2),
    .hamming(hamming)
  );
  
  // Stimulus
  initial begin
    // Initialize inputs
    in1 = 16'b1010101010101010;
    in2 = 16'b1100110011001100;

    #10;
 
    // Finish simulation
    $finish;
  end

endmodule
