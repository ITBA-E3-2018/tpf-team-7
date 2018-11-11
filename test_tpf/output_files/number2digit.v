module number2digit(ms, sec, min, hs, num_data);
	input [14:0] ms ;
	input [6:0] sec ;
	input [6:0] min ;
	input [6:0] hs ;
	
	output [43:0] num_data;
	
	assign num_data[0+:4] = hs / 10;
	assign num_data[4+:4] = hs % 10;
	assign num_data[8+:4] = 10;
	assign num_data[12+:4] = min / 10;
	assign num_data[16+:4] = min % 10;
	assign num_data[20+:4] = 10;
	assign num_data[24+:4] = sec / 10;
	assign num_data[28+:4] = sec % 10;
	assign num_data[32+:4] = 10;
	assign num_data[36+:4] = (ms / 100) / 10;
	assign num_data[40+:4] = (ms / 100) % 10;

endmodule