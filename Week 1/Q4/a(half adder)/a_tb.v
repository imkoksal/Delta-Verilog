module halfadder_tb();

	reg in1;
	reg in2;
	wire sum;
	wire carry;

	Half_Adder uut(
		.in1(in1),
		.in2(in2),
		.sum(sum),
		.carry(carry)
	
	);
	
	
	initial begin
	
	in1=1;
	in2=0;
	#10
	in1=0;
	in2=0;
	#10
	in1=1
	in2=1
	#10
	in1=0
	in2=1
	#10
	
	$finish;
	end
	endmodule