
module chrono(clk , start, rst, sec, min, hs);
	input clk;	
	input start;
	input rst;
	reg need_start = 1;
	output reg [10:0]ms;
	output reg [5:0]sec;
	output reg [5:0]min;
	output reg [5:0]hs;

	always @(posedge clk) begin
		if (~need_start) begin
			if (sec >= 59) begin
				sec <= 0;
				if (min >= 59) begin
					min <= 0;
					hs <= hs + 1;
				end	
				if (min < 59) begin
					min <= min + 1;
				end
			end
			if (sec < 59) begin
				sec <= sec + 1;
			end
		end
	end
	always @(posedge rst) begin
		sec <= 0;
		min <= 0;
		hs <= 0;
		need_start <= 1;
	end
	always @(posedge start) begin
		if (need_start) begin
			need_start <= 0;
		end
	end


endmodule
