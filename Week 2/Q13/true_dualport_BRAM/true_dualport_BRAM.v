`timescale 1ns / 1ps

module true_dualport_bram
#(parameter RAM_WIDTH=16,
            RAM_DEPTH=1024,
            ADDRESS=8       )(
    input clk,
    input wr_en_a,rd_en_a,
    input wr_en_b,rd_en_b,
    input [ADDRESS-1:0]address_a,address_b,
    input [RAM_WIDTH - 1:0]din_a,din_b,
    output reg [RAM_WIDTH - 1:0]dout_a,dout_b
    
    );
    reg [1:0] state;
    
    localparam NO_CHANGE=0;
    localparam READ_FIRST=1;
    localparam WRITE_FIRST=2;
    
    (*ram_style="block"*)
    reg [RAM_WIDTH - 1:0] BRAM [RAM_DEPTH-1:0];
    
    integer i;    
    initial begin
    for(i=0;i<RAM_DEPTH;i=i+1)begin
        BRAM[i]=0;
    end
    end    
   
 
    always@(posedge clk)begin 
        if((address_a==address_b) && (wr_en_a==wr_en_b))begin
            //assigning the data from port A to the memory if they collide
                     BRAM[address_a]<=din_a;              
        end  
        else begin
            case(state)
        
            NO_CHANGE:begin
                dout_a=BRAM[address_a];
                dout_b=BRAM[address_b];
            end
            
            
            
            READ_FIRST:begin
            
            if (rd_en_a== 1) begin
                dout_a=BRAM[address_a]; end
            if (rd_en_b== 1) begin    
                dout_b=BRAM[address_b]; end
                
            if (wr_en_a == 1) begin
                BRAM[address_a]=din_a; end
            if (wr_en_b == 1) begin
                BRAM[address_b]=din_b; end  
              
              end
           
           
           
            WRITE_FIRST:begin
            
            if (wr_en_a == 1) begin
                BRAM[address_a]=din_a; end
            if (wr_en_b == 1) begin
                BRAM[address_b]=din_b; end
                
            if (rd_en_a== 1) begin
                dout_a=BRAM[address_a]; end
            if (rd_en_b== 1) begin    
                dout_b=BRAM[address_b]; end
           end
           
           
           default:begin
           
           if (wr_en_a == 1) begin
                BRAM[address_a]=din_a; end
            if (wr_en_b == 1) begin
                BRAM[address_b]=din_b; end
                
            if (rd_en_a== 1) begin
                dout_a=BRAM[address_a]; end
            if (rd_en_b== 1) begin    
                dout_b=BRAM[address_b]; end
           end
           
           endcase
           end
        end
 
 endmodule

 