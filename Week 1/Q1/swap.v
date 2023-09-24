`timescale 1ns/1ps

module swap(
  input rst);
  
  reg reg1;
  reg reg2;
  
  //giving registers initial values
  initial begin
    reg1=1;
    reg2=0;
  end
  
  //swapping values of registers when reset signal comes
  always@(posedge rst) begin
    reg1<=reg2;
    reg2<=reg1;
    
  end
endmodule