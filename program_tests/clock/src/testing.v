`timescale 1ns / 1ps

module testing();
	reg clk = 1'b0;
	reg rst = 1'b0;
	reg ss = 1'b0;

	wire [14:0]ms; 
	wire [6:0]sec;
	wire [6:0]min;
	wire [6:0]hs;
	
	reloj r1(rst , ss, clk, ms, sec, min, hs);
	integer i;

	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,testing);

		for (i = 0;i <= 100000;i=i+1) begin
			#1 clk = 0;
			#1 clk = 1;
			if (i == 10000) begin
				ss = 1;
			end
			if (i == 10200) begin
				ss = 0;
			end
			if (i == 12000) begin
				rst = 1;
			end
			if (i == 12200) begin
				rst = 0;
			end;
			
			if (i == 15000) begin
				ss = 1;
				rst = 1;
			end
			if (i == 15500) begin
				ss = 0;
				rst = 0;
			end
			if (i == 90000) begin
				ss = 1;
			end
			if (i == 90002) begin
				ss = 0;
			end
		end
		#3
 		$finish;
	end

endmodule
