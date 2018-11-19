module reloj(rst, ss, clk, ms, sec,min ,hs);
	input clk;
	input rst;
	input ss; // start stop button
	
	output reg [14:0] ms = 0;
	output reg [6:0] sec = 0;
	output reg [6:0] min = 0;
	output reg [6:0] hs = 0;
	reg advance = 0;
	reg ss_old = 0;
	reg rst_old = 0;
	
	always @(posedge clk) begin // note we use a single always because synthesizing limitations
		if (ss == 0 && ss_old == 1) begin
			advance <= !advance; // start stop action
			
		end else if (rst == 1 && rst_old == 0) begin
			ms <= 0; // reset action
			sec <= 0;
			min <= 0;
			hs <= 0;
			advance <= 0;
		end else begin
			if (advance) begin // advance action
				if (ms < 9999) begin
					ms <= ms + 1;
				end else begin
					ms <= 0;
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
		end
		ss_old <= ss; // for edge detection
		rst_old <= rst;
	end
	
endmodule
