`timescale 1ns / 1ps

module n_bit_adder#(parameter N=8)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] sum,
    output  cout

    );
	
   //defining the sum of each FA
   wire [N:0]sum_between;
   
   //defining Cin and Cout to be used between the FA modules
   wire [N-1:0]carry_between;
    
    //creating a HA module instead of a FA in the first step
    assign sum_between[0]=a[0]^b[0];
    assign carry_between[0]=a[0]&b[0];
   

    
    genvar i;
    generate
    //generating N-1 amounts of FA modules(we already made the first one up top)
    for(i=1;i<N;i=i+1)begin
        full_adder n(
        .a(a[i]),
        .b(b[i]),
        .cin(carry_between[i-1]),
        .sum(sum_between[i]),
        .cout(carry_between[i])
        );
    
    end  
    endgenerate
    
    
    //assigning the summation and giving the most important digit the value of last carry
    assign sum={carry_between[N-1],sum_between[N-1:0]};
    
    //assigning last carry
    assign cout=carry_between[N-1];
    
endmodule
