`timescale 1ns / 1ps

module clk_divider_led #(parameter N = 27)(
    input clk,
    input rst,
    input [1:0] switch,
    output  led
);

reg led_reg;

initial begin
led_reg=0;
end



wire [N-1:0] din;
wire [N-1:0] clkdiv;

assign din = ~clkdiv;

genvar i;
generate 
    for (i=1;i<N;i=i+1) begin
        D_flipflop inst (
            .clk(clkdiv[i-1]), 
            .rst(rst),
            .d(din[i]),
            .q(clkdiv[i])
        );
    end
endgenerate


always@(posedge clk)begin
    case(switch)
        2'b00: led_reg = clkdiv[N-1]; //0.745hz
        2'b01: led_reg = clkdiv[N-2]; //1.49hz
        2'b10: led_reg = clkdiv[N-3]; //2.98hz
        2'b11: led_reg = clkdiv[N-4]; //5.96hz
        default: led_reg = 1'b0;
    endcase
end

assign led=led_reg;
endmodule