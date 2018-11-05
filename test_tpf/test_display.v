module test_display(clk, r_data, g_data, b_data);
	input clk;
	output reg [640*480:0]r_data;
	output reg [640*480:0]g_data;
	output reg [640*480:0]b_data;
	
	reg row = 0;
	reg col = 0;
	
	integer i;
	
	always @(posedge clk) begin
		if (row < 640) begin
			if (col < 479) begin
				r_data[col + 480 * row] <= 1;
				g_data[col + 480 * row] <= 0;
				b_data[col + 480 * row] <= 0;
				col <= col + 1;
			end else begin
				col <= 0;
				row <= row + 1;
			end
		end
	end
endmodule