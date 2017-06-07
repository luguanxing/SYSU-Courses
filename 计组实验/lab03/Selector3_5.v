`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 22:58:50
// Design Name: 
// Module Name: Selector3_5
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


module Selector3_5(
	input [4:0] i0,
	input [4:0] i1,
	output reg [4:0] out,
	input [1:0] select
    );
	
	always @(i0 or i1 or select) begin
		if(select == 2'b00)
			out = 5'b11111;
		if(select == 2'b01)
			out = i0;
		if(select == 2'b10)
			out = i1;
	end
	
endmodule
