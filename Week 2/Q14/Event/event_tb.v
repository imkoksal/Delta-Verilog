`timescale 1ns / 1ps

module tb_event();
reg clk,reset;
event reset_trigger,reset_done_trigger;



initial begin
clk=0;
reset=0;

@(reset_trigger);
reset=1;

@(reset_done_trigger);
reset=0;
end

initial begin
#10 ->reset_trigger;

#10 ->reset_done_trigger;
#10;
$finish;
end

endmodule
