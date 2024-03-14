module time_Multiplexer(
 input wire clk,
 input wire [15:0] data, // Input data to be displayed
 output reg [3:0] hex, // Segment data for display
 output reg [3:0] an // Display enable signals
);
reg [1:0] digit_counter = 2'b00; // Counter to select which digit 
to display
reg [18:0] refresh_counter = 19'd0; // Counter to control refresh 
rate
initial begin
hex <= 3'b000;
an <= 3'b111;
end
always @(posedge clk) begin
 // Increment the refresh counter
 if (refresh_counter == 19'd399999)
 refresh_counter <= 19'd0;
 else
 refresh_counter <= refresh_counter + 1;
 if (refresh_counter == 19'd399999) begin
 if (digit_counter == 2'b11)
 digit_counter <= 2'b00;
 else
 digit_counter <= digit_counter + 1;
 end
 case(digit_counter)
 2'b00: begin // Rightmost digit
 hex = data[3:0];
 an = 4'b1110;
 end
 2'b01: begin // Second from the right
 hex = data[7:4];
 an = 4'b1101;
 end
 2'b10: begin // Third from the right
 hex = data[11:8];
 an = 4'b1011;
 end
 2'b11: begin // Leftmost digit
 hex = data[15:12];
 an = 4'b0111;
 end
 default: begin
 // Should not reach here
 hex = 4'b0000;
an = 4'b1111;
 end
 endcase
end
endmodule