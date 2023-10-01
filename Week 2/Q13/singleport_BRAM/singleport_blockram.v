`timescale 1ns / 1ps

module singleport_blockram
#(parameter RAM_WIDTH=16,
            RAM_DEPTH=1024,
            ADRESS=8       )(
    input clk,
    input wr_en,
    input rd_en,
    input [ADRESS-1:0]address,
    input [RAM_WIDTH - 1:0]din,
    output reg[RAM_WIDTH - 1:0]dout
    
    );
    
    (*ram_style="block"*)
    reg [RAM_WIDTH - 1:0] BRAM [RAM_DEPTH-1:0];
    
    integer i;    
    initial begin
    for(i=0;i<RAM_DEPTH;i=i+1)begin
        BRAM[i]=0;
    end
    end    
   
    always@(posedge clk)begin    
    if(wr_en)begin
      BRAM[address]<=din;
    end
    if(rd_en)begin
        dout<=BRAM[address];
    end
    
    end
    
    
    
 endmodule
