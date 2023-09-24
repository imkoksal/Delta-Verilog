`timescale 1ns/1ps

module counter_3bit_tb();

    // Instantiate the module under test
    counter3bit uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
    );

    // Define the signals for the module inputs and outputs
    reg clk;
    reg reset;
    wire [2:0]counter;

    initial begin
      	 // Dump signals to waveform file
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus generation
    initial begin
      
      $dumpfile("waveform.vcd");
      $dumpvars(0, counter_3bit_tb);
        // Initialize inputs
        reset = 1;
        
        // Apply reset
        #10;
        reset = 0;
        #10;
        reset = 1;
      #10
      reset=0;

        // Let the counter cycle a few times
        #120;
      reset=1;
      #20
      reset=0;
      #40

        // Stop simulation
        $finish;
    end


endmodule
