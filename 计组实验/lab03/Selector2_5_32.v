`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/22 17:06:18
// Design Name: 
// Module Name: Selector2_5_32
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


module Selector2_5_32(
	input [31:0] i0,
	input [4:0] i1,
	output reg [31:0] out,
	input select
	);
	
	always @(i0 or i1 or select) begin
		if(select == 0)
			out = i0;
		else
			assign out = {27'b000000000000000000000000000, i1};
	end
	
endmodule

