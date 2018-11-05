module simple_counter (CLOCK_5, pin);
input CLOCK_5 ;
output reg pin;
reg [36:0] counter_out; 


always @ (posedge CLOCK_5) // on positive clock edge
begin
counter_out <= counter_out + 1;// increment counter
pin<= counter_out % 20000 < 10000;

end
endmodule 