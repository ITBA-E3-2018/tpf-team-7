// Number size = 64 * 48

module display_updater(clk, num_data, r, g, b, h_sync, v_sync);
	input clk;
	//input [640*480:0]r_data;
	//input [640*480:0]g_data;
	//input [640*480:0]b_data;
	//reg [640*480:0]screen1;
	///reg [64*80:0] nums[10:0];
	//nums[0] = 64*80b'
	
	reg [219:0]numbers;
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
		numbers[200+:20] = 20'b00000100000001000000; // :
		
		/*num_data[0+:4] = 4'b0000;
		num_data[4+:4] = 4'b0001;
		num_data[8+:4] = 4'b0010;
		num_data[12+:4] = 4'b0011;
		num_data[16+:4] = 4'b0100;
		num_data[20+:4] = 4'b0101;
		num_data[24+:4] = 4'b0110;
		num_data[28+:4] = 4'b0111;
		num_data[32+:4] = 4'b1000;
		num_data[36+:4] = 4'b1001;
		num_data[40+:4] = 4'b1010;*/
		
	end
	
	
	
	output reg r,g,b;
	output h_sync,v_sync;

	reg [10:0]row = 0;
	reg [10:0]col = 0;
	
	reg current = 0; // current number being updated
	reg current_pixel = 0; // current pixel being updated
	integer num, x, y, real_x, real_y, status, x_local;
	
	/*always @ (negedge clk) begin
		if (current_pixel < 50*30) begin
			current_pixel <= current_pixel + 1;
		end else begin
			current_pixel <= 0;
			if (current < 5) begin
				current <= current + 1;
			end else begin
				current <= 0;
			end
		end
		x = current_pixel % 30;
		y = current_pixel / 30;
		real_x = current * 40 + x;
		real_y = 300 + y;
		num = num_data[current*4+:4];
		status = numbers[num][ (x/10) + (y/10) * 3];
		
		screen1[y*640+x] = status;
	end*/
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
		
		
	
		// actualizaciones segun el protocolo de v_sync y h_sync
		// actualizacioens de colores a mostrar
		
		
	end
	
	always @(posedge clk) begin
		if (col >= 70 & col < 510 & row >= 100 & row < 150) begin

			r <= 1'b0;
			g <= numbers[ num_data[ (((col-70)/40)*4) +:4]*20 + 20 - (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];//1'b1; //numbers[ (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];
			b <= numbers[ num_data[ (((col-70)/40)*4) +:4]*20 + 20 - (( ( (col - 70) % 40)/10) + ( (row - 100)/10) * 4) ];
			
			//num_data[0+:4]
		end else begin
			r <= 1'b0;
			g <= 1'b0;
			b <= 1'b0;
		end
	end

endmodule