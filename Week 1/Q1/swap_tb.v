`timescale 1ns/1ps

module swap_tb;

    reg rst;
    reg reg1, reg2;

    // Instantiate the swap module
    swap uut (
        .rst(rst)
    );

    // Stimulus generation
    initial begin
      
        rst = 0;
        #5; 
        rst = 1;
        #10; 
        rst = 0;
        #10; 
       rst = 1;
        #10; 
        rst = 0;
        #10; 
       rst = 1;
        #10; 
        rst = 0;
        #10; 

        $finish; 
    end

endmodule
