`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 23:06:00
// Design Name: 
// Module Name: Extend
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


module Extend(
	input [15:0] bits_16,
	input [1:0] ExtSel,
	output reg [31:0] bits_32
    );
	
	always@(ExtSel) begin
		if(ExtSel == 2'b00)	//sll立即数shamt扩充立即数
			assign bits_32 = {27'h00000, bits_16[10:6]};
		if(ExtSel == 2'b01)	//ori立即数immediate
			assign bits_32 = {16'h0000, bits_16};
		if(ExtSel == 2'b10)	//addi、slti、lw、sw、beq判断符号
			assign bits_32 = bits_16[15] ? {16'hffff, bits_16} : {16'h0000, bits_16};
	end
	
endmodule
