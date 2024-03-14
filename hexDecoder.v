module hexDecoder(
    output reg [6:0] sevenOut,
    input [3:0] hexIn
    );

always@*
begin
case(hexIn)
4'b0000: sevenOut = 7'b0000001;
4'b0001: sevenOut = 7'b1001111;
4'b0010: sevenOut = 7'b0010010;
4'b0011: sevenOut = 7'b0000110;
4'b0100: sevenOut = 7'b1001100;
4'b0101: sevenOut = 7'b0100100;
4'b0110: sevenOut = 7'b0100000;
4'b0111: sevenOut = 7'b0001111;
4'b1000: sevenOut = 7'b0000000;
4'b1001: sevenOut = 7'b0001100;
4'b1010: sevenOut = 7'b0001000;
4'b1011: sevenOut = 7'b1100000;
4'b1100: sevenOut = 7'b0110001;
4'b1101: sevenOut = 7'b1000010;
4'b1110: sevenOut = 7'b0110000;
4'b1111: sevenOut = 7'b0111000;
endcase
end

endmodule
