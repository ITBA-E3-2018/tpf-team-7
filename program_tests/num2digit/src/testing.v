`timescale 1ns / 1ps

module testing();
	output [43:0] num_data;

	reg [14:0]ms; 
	reg [6:0]sec;
	reg [6:0]min;
	reg [6:0]hs;
	
	number2digit nd();
	integer i;

	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,testingfor (i = 0;i <= 100000;i=i+1) begin
			
		end
		#3
 		$finish;
	end

endmodule
