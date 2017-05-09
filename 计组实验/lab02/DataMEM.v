`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name:    DataMEM 
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
module DataMEM(
	input [31:0] DAddr,
	input [31:0] DataIn,
	input RD,
	input WR,
	input CLK,
	output reg[31:0] DataOut
	);
	reg [7:0] memory[0:310];

	always @(negedge CLK) begin
		if (RD == 1) begin
			memory[DAddr] = DataIn[31:24];
			memory[DAddr+1] = DataIn[23:16];
			memory[DAddr+2] = DataIn[15:8];
			memory[DAddr+3] = DataIn[7:0];
		end
		if (WR == 1) begin
			DataOut[31:24] = memory[DAddr];
			DataOut[23:16] = memory[DAddr+1];
			DataOut[15:8] = memory[DAddr+2];
			DataOut[7:0] = memory[DAddr+3];
		end
	end
endmodule
