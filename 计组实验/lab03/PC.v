`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/17 23:04:32
// Design Name: 
// Module Name: PC
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


module PC(
	input [31:0] pcIn,
	input CLK,
	input Reset,
	input [1:0] PCSrc,
	input PCWre,
	input [31:0] readData1,
	input [25:0] bits_26,
	output reg [31:0] pcOut,
	output reg [31:0] PC4
    );
	
	reg [31:0] pc;
	always @(posedge CLK or negedge Reset) begin
		if (Reset == 0) begin
			pcOut = 32'hF8;
			pc = 32'hF8;
		end
		else if(PCWre == 1) begin
			if(PCSrc == 2'b00)	//Õý³£Ö´ÐÐ
				pcOut = pc + 4;
			else if(PCSrc == 2'b01) //beq
				pcOut = pc + 4 + (pcIn << 2);
			else if(PCSrc == 2'b10) //jr
				pcOut = readData1;
			else //j,jal
				pcOut = {4'b0000, bits_26, 2'b00};
			pc = pcOut;
		end
		PC4 = pc + 4;
	end
	
endmodule
