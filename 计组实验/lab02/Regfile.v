`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	input [4:0] WriteReg,
	input [31:0] WriteData,
	input WE,
	input CLK,
	input clrn,
	output [31:0] ReadData1,
	output [31:0] ReadData2
	);
	reg [31:0] register[1:31];
	integer i;
	assign ReadData1 = (ReadReg1 == 0) ? 0 : register[ReadReg1];
	assign ReadData2 = (ReadReg2 == 0) ? 0 : register[ReadReg2];
	always @(posedge CLK or negedge clrn) begin
		if (clrn == 1) begin
			for(i=1; i<31; i=i+1)
				register[i] <= 0;
			
		end
		else begin
			if((WriteReg!=0) && (WE == 1))
				register[WriteReg] <= WriteData;
		end
	end
endmodule
