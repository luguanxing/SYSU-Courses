`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:16 04/20/2016 
// Design Name: 
// Module Name:    DataMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DataMemory(
	input RD,
	input WR, 
	input [31:0] DAddr, 
	input [31:0] DataIn, 
	output reg[31:0] DataOut
	);
	reg [7:0] memory[0:400];
	
	always @(DAddr or DataIn or RD or WR) begin
		if (WR == 0) begin // write
			memory[DAddr] = DataIn[31:24];
			memory[DAddr + 1] = DataIn[23:16];
			memory[DAddr + 2] = DataIn[15:8];
			memory[DAddr + 3] = DataIn[7:0];
		end
		if (RD == 0) begin // read
			DataOut={memory[DAddr],memory[DAddr+1],memory[DAddr+2],memory[DAddr+3]};
		end
	end
	
endmodule
