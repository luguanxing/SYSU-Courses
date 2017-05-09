`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 00:23:27
// Design Name: 
// Module Name:    scpu_sim 
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

module SCPU_sim();

	// Inputs
	reg clk, reset;

	// Outputs

	// ControlUnit
	wire RegWre;
	wire PCWre;
	wire ALUSrcB;
	wire [2:0] ALUOp;
	wire DBDataSrc;
	wire RegOut;
	wire RD;
	wire WR;
	wire PCSrc;
	wire ExtSel;
	wire insMemRW;

	// ALU
	wire [31:0] toALUA;
	wire [31:0] toALUB;
	wire [31:0] ALUresult;
	wire Zero;

	// DataMemory
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] dataOut;

	// Extend
	wire [31:0] bits_32;

	// InsMemory
	wire [31:0] pcOut;
	wire [31:0] iDataOut;

	// Regfile
	wire [4:0] writeReg;
	wire [31:0] writeData;

	// ParseIDataOut
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] Opcode;
	wire [15:0] immediate;
	
	SCPU uut (
		clk,
		reset,
		RegWre,
		PCWre,
		insMemRW,
		ALUSrcB,
		ALUOp,
		DBDataSrc,
		RegOut,
		RD,
		WR,
		PCSrc,
		ExtSel,
		toALUA,
		toALUB,
		ALUresult,
		Zero,
		readData1,
		readData2,
		dataOut,
		bits_32,
		pcOut,
		iDataOut,
		writeReg,
		writeData,
		rs,
		rt,
		rd,
		Opcode,
		immediate
	);
	
	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;

      #5;
    	reset = 0;
		forever #5 clk = ~clk;
	end

endmodule