`timescale 1ns / 1ps

module chip7458 ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire w2a;
    wire w2c;
    wire w1a;
    wire w1d;
    
    assign w1a=p1a&p1b&p1c;
    assign w1d=p1d&p1e&p1f;
    assign w2a=p2a&p2b;
    assign w2c=p2c&p2d;
    
	assign p1y=w1a|w1d;
    assign p2y=w2a|w2c;
    
  
endmodule