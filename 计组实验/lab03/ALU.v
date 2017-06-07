`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 23:43:13
// Design Name: 
// Module Name: ALU
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
			3'b010:result = (A < B ? 1 : 0);
			3'b011:result = A | 1;
			3'b100:result = B << A;
			3'b101:result = A | B;
			3'b110:result = A & B;
			3'b111:	//stli´ø·ûºÅ±È½Ï
				if (A<B && ( (A[31]==0&&B[31]==0) || (A[31]==1&&B[31]==1) ))
					result = 1;
				else if (A[31]==0 && B[31]==1)
					result = 0;
				else if (A[31]==1 && B[31]==0)
					result = 1;
				else
					result = 0; 
		endcase
		if (result == 32'b0)
			Zero = 1;
		else
			Zero = 0;
	end
endmodule
