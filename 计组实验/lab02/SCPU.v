`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date: 2017/04/18 00:23:27
// Design Name:   ControlUnit
// Module Name:
// Project Name:  SCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SCPU (
	input wire clk,
	input wire reset,
	input wire RegWre,
	input wire PCWre,
	input wire insMemRW,
	input wire ALUSrcB,
	input wire [2:0] ALUOp,
	input wire ALUM2Reg,
	input wire RegOut,
	input wire RD,
	input wire WR,
	input wire PCSrc,
	input wire ExtSel,
	input wire [31:0] toALUA,
	input wire [31:0] toALUB,
	input wire [31:0] ALUresult,
	input wire Zero,
	input wire [31:0] readData1,
	input wire [31:0] readData2,
	input wire [31:0] dataOut,
	input wire [31:0] bits_32,
	input wire [31:0] pcOut,
	input wire [31:0] iDataOut,
	input wire [4:0] writeReg,
	input wire [31:0] writeData,
	input wire [4:0] rs,
	input wire [4:0] rt,
	input wire [4:0] rd,
	input wire [5:0] Opcode,
	input wire [15:0] immediate
	);

	// Instantiate the Unit Under Test (UUT)
	ControlUnit controlunit (
		.Opcode(Opcode), 
		.Zero(Zero), 
		.RegWre(RegWre), 
		.PCWre(PCWre), 
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB), 
		.ALUOp(ALUOp), 
		.ALUM2Reg(ALUM2Reg), 
		.RegOut(RegOut), 
		.RD(RD), 
		.WR(WR),
		.PCSrc(PCSrc), 
		.insMemRW(insMemRW),
		.ExtSel(ExtSel)
	);

	ALU alu (
		.A(toALUA), 
		.B(toALUB), 
		.Zero(Zero), 
		.result(ALUresult), 
		.ALUOp(ALUOp)
    );

    DataMEM datamem (
		.RD(RD), 
		.WR(WR),
		.DAddr(ALUresult), 
		.DataIn(readData2), 
		.DataOut(dataOut), 
		.CLK(clk)
    );

    Extend extend (
		.bits_16(immediate), 
		.ExtSel(ExtSel), 
		.bits_32(bits_32)
    );

    InsMEM insmem (
		.IAddr(pcOut),
		.InsMemRW(insMemRW),
		.IDataOut(iDataOut)
    );

    PC pc (
		.pcIn(bits_32), 
		.CLK(clk), 
		.Reset(reset), 
		.PCSrc(PCSrc), 
		.PCWre(PCWre), 
		.pcOut(pcOut)
    );

    RegisterFile registerfile (
		.ReadReg1(rs), 
		.ReadReg2(rt), 
		.WriteData(writeData), 
		.WriteReg(writeReg), 
		.WE(RegWre), 
		.CLK(clk), 
		.clrn(reset), 
		.ReadData1(readData1), 
		.ReadData2(readData2)
    );

    WireDistributor wiredistributor(
		.iDataOut(iDataOut), 
		.Opcode(Opcode), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.immediate(immediate)
    );

    Selector_32 selector_32_datamem (
		.i0(ALUresult), 
		.i1(dataOut), 
		.out(writeData), 
		.select(ALUM2Reg)
    );

    Selector_32 selector_32a (
		.i0(readData1), 
		.i1(iDataOut), 
		.out(toALUA), 
		.select(ALUSrcA)
    );
	
    Selector_32 selector_32b (
		.i0(readData2), 
		.i1(bits_32), 
		.out(toALUB), 
		.select(ALUSrcB)
    );

    Selector_5 selector_5_insmem (
		.i0(rt), 
		.i1(rd), 
		.out(writeReg), 
		.select(RegOut)
    );
endmodule

