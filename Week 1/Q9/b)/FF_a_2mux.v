`timescale 1ns / 1ps

module FF_and_2mux#(parameter N=4)(
input clk,
input sel1,
input sel2,
input w,
input [N-1:0] r,
output  [N-1:0] q
    );

    ff_a_2m inst0(
        .clk(clk),
        .sel1(sel1),
        .sel2(sel2),
        .r(r[N-1]),
        .q_in(w),
        .q(q[0])
    );



genvar i;
generate
    for(i=1;i<N;i=i+1)begin
    ff_a_2m inst2(
        .clk(clk),
        .sel1(sel1),
        .sel2(sel2),
        .r(r[N-1-i]),
        .q_in(q[i-1]),
        .q(q[i])
    );
    end
endgenerate


endmodule
