`timescale 1ns/1ps

module top_module_tb;

  // Inputs and outputs for the module under test
  reg [31:0] in;
  wire [31:0] out;

  // Instantiate the module under test
  top_module dut (
    .in(in),
    .out(out)
  );

  // Clock generation
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    // Initialize inputs
    in = 32'h12345678;

    // Apply inputs and observe outputs
    repeat(10) begin
      #10; // Wait for a while
      in = in + 1; // Change the input for next iteration
    end

    // End simulation
    $finish;
  end

endmodule
