`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name:    InsMEM 
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
module InsMEM(
	input [31:0] IAddr,
	input [31:0] InsMemRW,
	output reg[31:0] IDataOut
	);
	reg [7:0] memory[0:511];
	reg [31:0] instruction;
	integer i;
	initial begin
		 memory[0] = 8'b01000000;
		 memory[1] = 8'b00000001;
		 memory[2] = 8'b00000000;
		 memory[3] = 8'b00001011;
		 memory[4] = 8'b00000100;
		 memory[5] = 8'b00100010;
		 memory[6] = 8'b11111111;
		 memory[7] = 8'b11111101;
		 memory[8] = 8'b01000100;
		 memory[9] = 8'b00100010;
		memory[10] = 8'b00011000;
		memory[11] = 8'b00000000;
		memory[12] = 8'b01001000;
		memory[13] = 8'b00100010;
		memory[14] = 8'b00100000;
		memory[15] = 8'b00000000;
		memory[16] = 8'b00000000;
		memory[17] = 8'b01100100;
		memory[18] = 8'b00101000;
		memory[19] = 8'b00000000;
		memory[20] = 8'b10000000;
		memory[21] = 8'b10100000;
		memory[22] = 8'b00011000;
		memory[23] = 8'b00000000;
		memory[24] = 8'b11000000;
		memory[25] = 8'b01100100;
		memory[26] = 8'b00000000;
		memory[27] = 8'b00000100;
		memory[28] = 8'b10011000;
		memory[29] = 8'b10000101;
		memory[30] = 8'b00000000;
		memory[31] = 8'b00101000;
		memory[32] = 8'b10011100;
		memory[33] = 8'b10100100;
		memory[34] = 8'b00000000;
		memory[35] = 8'b00100000;
		memory[36] = 8'b00001000;
		memory[37] = 8'b01000001;
		memory[38] = 8'b00110000;
		memory[39] = 8'b00000000;
		memory[40] = 8'b11000000;
		memory[41] = 8'b01100100;
		memory[42] = 8'b11111111;
		memory[43] = 8'b11111011;
		memory[44] = 8'b11111100;
		memory[45] = 8'b00000000;
		memory[46] = 8'b00000000;
		memory[47] = 8'b00000000;	
	end
	always @(IAddr) begin
		i = (IAddr - 32'h100) / 4;
		instruction = { memory[4*i], memory[4*i + 1], memory[4*i + 2], memory[4*i+ 3] };
		IDataOut[31:0] = instruction[31:0];
	end
endmodule
