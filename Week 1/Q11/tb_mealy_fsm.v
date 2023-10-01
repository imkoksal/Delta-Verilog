`timescale 1ns / 1ps

module testbench_mealy_fsm;

    reg clk;        // Clock signal
    reg din;        // Input din
    reg rst;        // Reset signal
    wire d_out;     // Output d_out

    // Instantiate the finite state machine module
    mealy_fsm mealy_fsm_inst (
        .clk(clk),
        .din(din),
        .rst(rst),
        .d_out(d_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    
    // Reset generation
    initial begin
        rst = 1;
        clk = 0;
        din = 0;
        #5 rst = 1;
        #10 rst = 0;
        #20 din = 1;
        #20 din = 0;
        #10 din = 1;
        #20 din = 1;
        #20 rst = 1;
        
        
        // Test sequence

        // End simulation
        $finish;
    end
    
endmodule
