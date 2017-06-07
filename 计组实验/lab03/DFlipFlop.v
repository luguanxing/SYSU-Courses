`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/15 17:22:31
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop(
	input [2:0] nextState,
	input RST,
	input CLK,
	output reg [2:0] state
    );
	always @(posedge CLK or negedge RST) begin
		if (RST==0) begin
			state = 3'b000;
		end
		else begin
			#1;
			state = nextState;
		end
	end
endmodule
