`timescale 1ns / 1ps

module testing();
	reg clk = 1'b0;
	reg rst = 1'b0;
	reg ss = 1'b0;

	wire r,g,b,h_sync, v_sync;
	reg [43:0] num_data;

	
	display_updater dd(clk, num_data, r, g, b, h_sync, v_sync);
	integer i;

	initial begin
		num_data[0+:4] = 4'b0000;
		num_data[4+:4] =  4'b0001;
		num_data[8+:4] =  4'b0010;
		num_data[12+:4] =  4'b0011;
		num_data[16+:4] =  4'b0100;
		num_data[20+:4] =  4'b0101;
		num_data[24+:4] =  4'b0110;
		num_data[28+:4] =  4'b0111;
		num_data[32+:4] =  4'b1000;
		num_data[36+:4] =  4'b1001;
		num_data[40+:4] =  4'b1010;

		$dumpfile("output.vcd");
		$dumpvars(0,testing);
		
		// frecuencia = 25.125Mhz

		for (i = 0;i <= 1000000;i=i+1) begin
			#19.9 clk = 0; // mitad de periodo
			#19.9 clk = 1; // mitad de periodo
		end
		#3
 		$finish;
	end

endmodule
