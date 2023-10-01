`timescale 1ns / 1ps
module clk_divider_led(
    input clk,
    input rst,
    input [1:0] switch,
    output led
    );
reg led_reg;
wire [26:0] din;
wire [26:0] clkdiv;
 

 
d_flipflop dff_inst0 (
    .clk(clk),
    .rst(rst),
    .d(din[0]),
    .q(clkdiv[0])
);
 
genvar i;
generate
for (i = 1; i < 27; i=i+1) 
begin : dff_gen_label
    d_flipflop dff_inst (
        .clk(clkdiv[i-1]),
        .rst(rst),
        .d(din[i]),
        .q(clkdiv[i])
    );
    end
endgenerate
 
assign din = ~clkdiv;

always@(posedge clk)begin
    case(switch)
 
        2'b00:led_reg=clkdiv[26];
        2'b01:led_reg=clkdiv[25];
        2'b10:led_reg=clkdiv[24];//2.98
        2'b11:led_reg=clkdiv[23];//5.96hz
        default:led_reg=0;
    endcase
end
 
 assign led=led_reg;
 
endmodule