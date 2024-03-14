module ALU(
 output reg [15:0] out,
output reg overflow,
 input [2:0] input_a,
 input [2:0] input_b,
 input [1:0] op
 );
reg [15:0] a,b;
always@(*)
begin
a <= {13'b0,input_a};
b <= {13'b0,input_b};
end
always@(a or b or op)
begin
 case(op)
 2'b00: begin 
 out = a + b;
 overflow = (a[15] & b[15] & ~out[15]) | (~a[15] & ~b[15] 
& out[15]);
 end
 2'b01: begin 
 out = a - b;
 overflow = (a[15] & ~b[15] & ~out[15]) | (~a[15] & b[15] 
& out[15]);
 end
 2'b10: begin
out = a * b;
 if ((a != 0) && (b != 0) && (out / a != b))
 overflow = 1'b1;
 else
 overflow = 1'b0;
 end
 2'b11: begin 
 out = (~a) + 1;
 overflow = 1'b0; 
 end
 default: begin
 out = 16'b0;
 overflow = 1'b0;
 end
 endcase
end
endmodule