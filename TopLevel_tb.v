module TopLevel_tb;
// Inputs
reg [1:0] op;
reg [2:0] input_a;
reg [2:0] input_b;
reg clk;
// Outputs
wire [15:0] out;
wire [3:0] an;
wire overflow;
wire [6:0] seg_out;
// Instantiate the Unit Under Test (UUT)
TopLevel uut (
.out(out), 
.seg_out(seg_out), 
.an(an),
.overflow(overflow),
.op(op),
.input_a(input_a),
.input_b(input_b),
.clk(clk)
);
initial begin
 clk = 1'b0;
end
initial forever #5 clk = ~clk;
initial begin
// Initialize Inputs
input_a = 3'b011;
input_b = 3'b111;
op = 2'b00;
// Wait 100 ns for global reset to finish
#100;
 
input_a = 3'b110;
input_b = 3'b100;
op = 2'b01;
// Wait 100 ns for global reset to finish
#100;
input_a = 3'b100;
input_b = 3'b101;
op = 2'b10;
// Wait 100 ns for global reset to finish
#100;
input_a = 3'b011;
op = 2'b11;
// Wait 100 ns for global reset to finish
#100;
end
 
endmodule
