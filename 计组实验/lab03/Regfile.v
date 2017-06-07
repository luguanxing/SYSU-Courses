`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/17 23:21:06
// Design Name: 
// Module Name: Regfile
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


module Regfile(
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
		if (clrn == 0) begin
			//为了在红绿色的波形图上显示更清楚测试时注视掉清零
			//for(i=1; i<31; i=i+1)
			//	register[i] = 0;
		end
		else begin
			if((WriteReg!=0) && (WE == 1))
				register[WriteReg] = WriteData;
		end
	end
endmodule
