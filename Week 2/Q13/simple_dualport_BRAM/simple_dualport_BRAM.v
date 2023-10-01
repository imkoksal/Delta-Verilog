`timescale 1ns / 1ps

module simple_dualport_bram
#(parameter RAM_WIDTH=16,
            RAM_DEPTH=1024,
            ADDRESS=8       )(
    input clk,
    input wr_en_a,
    input rd_en_b,
    input [ADDRESS-1:0]address_a,
    input [ADDRESS-1:0]address_b,
    input [RAM_WIDTH - 1:0]din_a,
    output reg[RAM_WIDTH - 1:0]dout_b
    
    );
    reg [1:0] state;
    
    localparam READ_FIRST=1;
    localparam WRITE_FIRST=2;
    localparam NO_CHANGE=3;
        
        
    (*ram_style="block"*)
    reg [RAM_WIDTH - 1:0] BRAM [RAM_DEPTH-1:0];
    
    integer i;    
    initial begin
        for(i=0;i<RAM_DEPTH;i=i+1)begin
            BRAM[i]=0;
        end
    end    
   
    always@(posedge clk)begin 
        if(address_a==address_b)begin   
            case(state)
        
            NO_CHANGE:begin
                dout_b=BRAM[address_b];
            end
            
            READ_FIRST:begin
            dout_b=BRAM[address_b];
            BRAM[address_a]=din_a;  
        end
           
        WRITE_FIRST:begin
            BRAM[address_a]=din_a;
            dout_b=BRAM[address_b];
           end
           default:begin
           if(wr_en_a)begin
                        BRAM[address_a]<=din_a;
                    end
                    if(rd_en_b)begin
                        dout_b<=BRAM[address_b];
                    end 
           end
           
           endcase
           end
        
 end
 endmodule