`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:27 04/19/2016 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
	input[5:0] Opcode,
	input Zero,
	input CLK,
	input RST,
	output RegWre,
	output PCWre,
	output ALUSrcA,
	output ALUSrcB,
	output DBDataSrc,
	output RD,
	output WR,
	output WrRegDSrc,
	output IRWre,
	output InsMemRW,
	output [2:0] ALUOp,
	output [1:0] ExtSel,
	output [1:0] PCSrc,
	output [1:0] RegDst,
	output [2:0] state
    );
	wire [2:0] nextState;

	DFlipFlop DFlipFlop(
		nextState,
		RST,
		CLK,
		state
	);
	
	State NextState(
		state,
		Opcode,
		nextState
	);
	OutputFunction outputFunction(
		state,
		Opcode,
		Zero, 
		RegWre,
		PCWre,
		ALUSrcA,
		ALUSrcB,
		DBDataSrc,
		RD,
		WR,
		InsMemRW,
		WrRegDSrc,
		IRWre,
		ALUOp,
		ExtSel,
		PCSrc,
		RegDst
	);

endmodule
