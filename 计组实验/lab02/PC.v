`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name:    PC 
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
module PC(
	input [31:0] pcIn,
	input CLK,
	input Reset,
	input PCSrc,
	input PCWre,
	output reg [31:0] pcOut
	);
	reg [31:0] pc;
	always @(posedge CLK or posedge Reset) begin
		if (Reset == 1) begin
			pcOut = 32'h100;
			pc = 32'h100;
		end
		else if (PCWre != 0) begin
			if(PCSrc == 0)
				pcOut = pc + 4;
			else
				pcOut = pc + 4 + (pcIn << 2);
			pc = pcOut;
		end
	end
endmodule
