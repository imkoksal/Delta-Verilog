`timescale 1ns/1ps

module n_bit_adder_tb #(parameter N = 8);
  // Inputs
  reg [N-1:0] a;
  reg [N-1:0] b;

  // Outputs
  wire [N-1:0] sum;

  // Instantiate the DUT
  n_bit_adder #(.N(N)) uut (
    .a(a),
    .b(b),
    .sum(sum),
	.cout(cout)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    a = 90;
    b = 18;
    #10;
    a = 21;
    b = 52;
    #10;
    a = 73;
    b = 86;
    #10;
    a = 96;
    b = 53;
    #10;
    a = 53;
    b = 55;
    #10;
    a = 55;
    b = 85;
    #10;
    a = 71;
    b = 71;
    #10;
    a = 75;
    b = 21;
    #10;
    $finish;
  end

  // Output checking
  always @(posedge clk) begin
    $display("Sum: %b", sum);
  end

endmodule