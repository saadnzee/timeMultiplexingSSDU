module TopLevel(
 output wire [15:0] out, // alu-output
 output wire overflow,
 output wire [6:0] seg_out, // Multiplexed seven-segment output
 output wire [3:0] an,
 input [2:0] input_a, input_b,
 input clk,
 input [1:0] op
);
wire [15:0] alu_out;
ALU uut1 (.input_a(input_a),.input_b(input_b),.op(op),.out(alu_out), 
.overflow(overflow));
assign out = alu_out;
wire [3:0] hexIn;
time_Multiplexer uut3(.clk(clk), .data(alu_out), .an(an), 
.hex(hexIn));
hexDecoder uut2 (.hexIn(hexIn), .sevenOut(seg_out));
endmodule