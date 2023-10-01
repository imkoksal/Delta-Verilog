`timescale 1ns / 1ps

module mux_and_FF(
input clk,
input sel,
input [2:0] r,
output  [2:0] q
    );

    m_a_ff inst0(
        .clk(clk),
        .sel(sel),
        .r(r[0]),
        .q_in(q[2]),
        .q(q[0])
    );

    m_a_ff inst1(
        .clk(clk),
        .sel(sel),
        .r(r[1]),
        .q_in(q[0]),
        .q(q[1])
    );

wire x_or;
assign x_or=q[2]^q[1];

    m_a_ff inst2(
        .clk(clk),
        .sel(sel),
        .r(r[2]),
        .q_in(x_or),
        .q(q[2])
    );



endmodule
