module clock_test();
	reg clk;
	reg start;
	reg rst;

	wire [5:0]sec;
	wire [5:0]min;
	wire [5:0]hs;

	integer i;
	
	chrono my_chrono(clk, start, rst, sec, min, hs);

	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,my_chrono);
		#0 start = 0;
		#0 rst = 0;		
		#1 start = 1;
		
		for (i = 0;i <= 1000000;i=i+1) begin
			#1 clk = 1;
			#1 clk = 0;	
		end	
		$finish;	
	end

endmodule
