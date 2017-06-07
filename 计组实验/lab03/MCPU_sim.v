`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/21 17:42:00
// Design Name: 
// Module Name: MCPU_sim
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


module MCPU_sim();
	// Inputs
	reg clk;
	reg reset;

	// ControlUnit
	wire RegWre;
	wire PCWre;
	wire ALUSrcA;
	wire ALUSrcB;
	wire [2:0] ALUOp;
	wire DBDataSrc;
	wire [1:0] RegDst;
	wire RD;
	wire WR;
	wire InsMemRW;
	wire [1:0] PCSrc;
	wire [1:0] ExtSel;
	wire WrRegDSrc;
	wire IRWre;
	wire [2:0] state;

	// ALU
	wire [31:0] toALUA;
	wire [31:0] toALUB;
	wire [31:0] ALUresult;
	wire Zero;

	// DataMemory
	wire [31:0] dataOut;
	wire [31:0] dAddr;
	wire [31:0] DBDRin;
	wire [31:0] DBDRout;

	// Extend
	wire [31:0] bits_32;

	// InsMemory
	wire [31:0] pcOut;
	wire [31:0] iDataOut;

	// Regfile
	wire [4:0] writeReg;
	wire [31:0] writeData;
	wire [31:0] readData1;
	wire [31:0] readData2;

	// InsRegister
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] sa;
	wire [5:0] Opcode;
	wire [15:0] immediate;

	// PC
	wire [31:0] pc4;
	wire [25:0] bits_26;

	// Delay
	wire [31:0] BDRout;
	wire [31:0] ADRout;

	MCPU uut(
		clk, 
		reset,
		RegWre,
		PCWre,
		ALUSrcA,
		ALUSrcB,
		ALUOp,
		DBDataSrc,
		RegDst,
		RD,
		WR,
		InsMemRW,
		PCSrc,
		ExtSel,
		WrRegDSrc,
		IRWre,
		state,
		toALUA,
		toALUB,
		ALUresult,
		Zero,
		dataOut,
		dAddr,
		DBDRin,
		DBDRout,
		bits_32,
		pcOut,
		iDataOut,
		writeReg,
		writeData,
		readData1,
		readData2,
		rs,
		rt,
		rd,
		sa,
		Opcode,
		immediate,
		pc4,
		bits_26,
		BDRout,
		ADRout
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#5;
    	reset = 1;
		forever #5 clk = ~clk;
	end
	
endmodule
