`timescale 1ns/1ps

module hamming(
  input [15:0] in1,
  input [15:0] in2,
  output [15:0] hamming
);

  // Perform bitwise XOR of each bit
  assign hamming = in1 ^ in2;

endmodule