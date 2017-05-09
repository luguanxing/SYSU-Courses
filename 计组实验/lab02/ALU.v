`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name: ALU32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	input [31:0] A,
	input [31:0] B,
	input [2:0] ALUOp,
	output reg Zero,
	output reg [31:0] result
	);
	always @(A or B or ALUOp or result) begin
		case(ALUOp)
			3'b000:result = A + B;
			3'b001:result = A - B;
			3'b010:result = A < B ? 1:0;
			3'b011:result = A | B;
			3'b100:result = A & B;
			3'b101:result = A << B;
			3'b110:result = (~A & B) | (A | ~B);
			3'b111:result = (A & B) | (~A | ~B);
		endcase
		if (result == 32'b0)
			Zero = 1;
		else Zero = 0;
	end
endmodule
