module reloj(rst, ss, clk, num_data);
	input clk;
	input rst;
	input ss;
	
	output [43:0]num_data;
	reg [14:0] fms = 0;
	reg [6:0] sec = 0;
	reg [6:0] min = 0;
	reg [6:0] hs = 0;
	reg advance = 0;
	reg ss_old = 0;

	always @(posedge clk) begin
		if (ss == 0 && ss_old == 1) begin
			advance <= !advance;
			
		end
		if (advance) begin
			if (fms < 9999) begin
				fms <= fms + 1;
			end else begin
				fms <= 0;
				if (sec < 59) begin
					sec <= sec + 1;
				end else begin
					sec <= 0;
					if (min < 59) begin
						min <= min + 1;
					end else begin
						min <= 0;
						if (hs < 23) begin
							hs <= hs + 1;
						end else begin
							hs <= 0;
						end
					end
				end
			end
		end
		ss_old <= ss;
	end
	
	assign num_data[0+:4] = hs / 10;
	assign num_data[4+:4] = hs % 10;
	assign num_data[8+:4] = 10;
	assign num_data[12+:4] = min / 10;
	assign num_data[16+:4] = min % 10;
	assign num_data[20+:4] = 10;
	assign num_data[24+:4] = sec / 10;
	assign num_data[28+:4] = sec % 10;
	assign num_data[32+:4] = 10;
	assign num_data[36+:4] = (fms / 100) / 10;
	assign num_data[40+:4] = (fms / 100) % 10;
	
endmodule