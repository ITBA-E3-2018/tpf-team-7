// Number size = 64 * 48

module display_updater(clk, num_data, r, g, b, h_sync, v_sync);
	input clk;
	
	reg [219:0]numbers;
	reg [119:0] msg;
	
	input [43:0]num_data;
	wire data_reg;
	integer i;
	
	initial begin
		numbers[0+:20]   = 20'b11101010101010101110;
		numbers[20+:20]  = 20'b00100010001000100010;
		numbers[40+:20]  = 20'b11100010111010001110;
		numbers[60+:20]  = 20'b11100010111000101110;
		numbers[80+:20]  = 20'b10101010111000100010;
		numbers[100+:20] = 20'b11101000111000101110;
		numbers[120+:20] = 20'b11101000111010101110;
		numbers[140+:20] = 20'b11100010001000100010;
		numbers[160+:20] = 20'b11101010111010101110;
		numbers[180+:20] = 20'b11101010111000100010;
		numbers[200+:20] = 20'b00000100000001000000;
		
		msg[0+:20]   = 20'b11100100010001000100;
		msg[20+:20]  = 20'b11101010111010001000;
		msg[40+:20]  = 20'b11101000111010001000;
		msg[60+:20]  = 20'b00000000000000000000;
		msg[80+:20]  = 20'b11101000111010101110;
		msg[100+:20] = 20'b11100010001000100010;
	end
	
	
	
	output reg r,g,b;
	output h_sync,v_sync;

	reg [10:0]row = 0;
	reg [10:0]col = 0;

	assign h_sync = (640 + 16 <= col && col < 640 + 16 + 96);
	assign v_sync = (480 + 11 <= row && row < 480 + 11 + 2);
		
		
	always @ (posedge clk) begin
		if (col < 799) begin
			col <= col + 1;
		end else begin
			col <= 0;
			if (row < 523) begin
				row <= row + 1;
			end else begin 
				row <= 0;
			end
		end
	end
	
	always @(posedge clk) begin
		if (col >= 70 & col < 510 & row >= 100 & row < 150) begin

			r <= numbers[ num_data[ (((col-70)/40)*4) +:4]*20 + 20 - (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];
			g <= numbers[ num_data[ (((col-70)/40)*4) +:4]*20 + 20 - (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];//1'b1; //numbers[ (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];
			b <= numbers[ num_data[ (((col-70)/40)*4) +:4]*20 + 20 - (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];
		end else if (col >= 160 & col < 400 & row >= 300 & row < 350) begin
			r <= msg[ ((col-160)/40)*20 + 20 - (( ( (col - 160) % 40)/10) + ( (row - 300)/10) * 4) ];
			g <= msg[ ((col-160)/40)*20 + 20 - (( ( (col - 160) % 40)/10) + ( (row - 300)/10) * 4) ];
			b <= 0;
		
		end else begin
			r <= 1'b0;
			g <= 1'b0;
			b <= 1'b0;
		end
	end

endmodule