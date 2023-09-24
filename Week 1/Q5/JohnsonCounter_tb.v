
`timescale 1ns/1ps

module JohnsonCounter_tb;
  reg clk;
  reg rst;
  
  wire counter;
  
  
  //connecting ports
  JohnsonCounter uut(
    .clk(clk),
    .rst(rst),
    .counter(counter));
  
 
  initial begin
     // Add a VCD file to save waveform data
    $dumpfile("waveform.vcd");
    $dumpvars(0, JohnsonCounter_tb); // Dump all signals
    clk = 1'b0;
    rst = 1'b0;
    #60 rst = 1'b1;
  end

  always begin
    #10 clk = ~clk;
  end
	
  initial begin
    #160 $finish;
  end
      
endmodule