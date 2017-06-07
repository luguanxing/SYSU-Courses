`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/20 21:08:41
// Design Name: 
// Module Name: InsRegister
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


module InsRegister(
	input [31:0] iDataOut,
	input CLK,
	input IRWre,
	output reg [5:0] Opcode,
	output reg [4:0] rs,
	output reg [4:0] rt,
	output reg [4:0] rd,
	output reg [4:0] sa,
	output reg [15:0] immediate,
	output reg [25:0] bits_26
    );
    always @(negedge CLK) begin
		Opcode <= iDataOut[31:26];
		rs <= iDataOut[25:21];
		rt <= iDataOut[20:16];
		rd <= iDataOut[15:11];
		sa <= iDataOut[10:6];
		immediate <= iDataOut[15:0];
		bits_26 <= iDataOut[25:0];
    end
endmodule
