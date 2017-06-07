`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/21 17:42:00
// Design Name: 
// Module Name: MCPU
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


module MCPU(
	input clk, 
	input reset,
	input RegWre,
	input PCWre,
	input ALUSrcA,
	input ALUSrcB,
	input [2:0] ALUOp,
	input DBDataSrc,
	input [1:0] RegDst,
	input RD,
	input WR,
	input InsMemRW,
	input [1:0] PCSrc,
	input [1:0] ExtSel,
	input WrRegDSrc,
	input IRWre,
	input [2:0] state,
	input [31:0] toALUA,
	input [31:0] toALUB,
	input [31:0] ALUresult,
	input Zero,
	input [31:0] dataOut,
	input [31:0] dAddr,
	input [31:0] DBDRin,
	input [31:0] DBDRout,
	input [31:0] bits_32,
	input [31:0] pcOut,
	input [31:0] iDataOut,
	input [4:0] writeReg,
	input [31:0] writeData,
	input [31:0] readData1,
	input [31:0] readData2,
	input [4:0] rs,
	input [4:0] rt,
	input [4:0] rd,
	input [4:0] sa,
	input [5:0] Opcode,
	input [15:0] immediate,
	input [31:0] pc4,
	input [25:0] bits_26,
	input [31:0] BDRout,
	input [31:0] ADRout
    );
	
	ControlUnit controlUnit (
		.Opcode(Opcode), 
		.Zero(Zero), 
		.RegWre(RegWre), 
		.PCWre(PCWre), 
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB),
		.InsMemRW(InsMemRW),	
		.ALUOp(ALUOp), 
		.DBDataSrc(DBDataSrc), 
		.RegDst(RegDst), 
		.RD(RD), 
		.WR(WR),
		.PCSrc(PCSrc), 
		.ExtSel(ExtSel),
		.WrRegDSrc(WrRegDSrc),
		.IRWre(IRWre),
		.CLK(clk),
		.RST(reset),
		.state(state)
	);
	
	ALU alu (
		.A(toALUA), 
		.B(toALUB), 
		.Zero(Zero), 
		.result(ALUresult), 
		.ALUOp(ALUOp)
    );

    DataMemory dataMemory (
		.RD(RD), 
		.WR(WR),
		.DAddr(dAddr), 
		.DataIn(BDRout), 
		.DataOut(dataOut)
    );

    Extend extend (
		.bits_16(immediate), 
		.ExtSel(ExtSel), 
		.bits_32(bits_32)
    );

    InsMEM insMEM (
		.IAddr(pcOut), 
		.InsMemRW(InsMemRW),
		.IDataOut(iDataOut)
    );

    PC pC (
		.pcIn(bits_32), 
		.CLK(clk), 
		.Reset(reset), 
		.PCSrc(PCSrc), 
		.PCWre(PCWre), 
		.pcOut(pcOut),
		.readData1(readData1),
		.bits_26(bits_26),
		.PC4(pc4)
    );

    Regfile regfile (
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

    InsRegister InsRegister(
		.iDataOut(iDataOut), 
		.IRWre(IRWre),
		.Opcode(Opcode), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.sa(sa),
		.immediate(immediate),
		.bits_26(bits_26),
		.CLK(clk)
    );

    Selector2_32 mux_DataMemory (
		.i0(ALUresult), 
		.i1(dataOut), 
		.out(DBDRin), 
		.select(DBDataSrc)
    );

    Selector2_32 mux_writeData (
		.i0(pc4), 
		.i1(DBDRout), 
		.out(writeData), 
		.select(WrRegDSrc)
    );

    Selector2_5_32 mux_RegfileA (
		.i0(toALUA), 
		.i1(sa), 
		.out(ADRout), 
		.select(ALUSrcA)
    );
	
    Selector2_32 mux_RegfileB (
		.i0(BDRout), 
		.i1(bits_32), 
		.out(toALUB), 
		.select(ALUSrcB)
    );

    Selector3_5 mux_InsMemory (
		.i0(rt), 
		.i1(rd), 
		.out(writeReg), 
		.select(RegDst)
    );

    Delay ADR (
		.in(readData1), 
		.out(toALUA), 
		.CLK(clk)
    );

    Delay BDR (
		.in(readData2), 
		.out(BDRout), 
		.CLK(clk)
    );

    Delay ALUout (
		.in(ALUresult), 
		.out(dAddr), 
		.CLK(clk)
    );

    Delay DBDR (
		.in(DBDRin), 
		.out(DBDRout), 
		.CLK(clk)
    );
	
endmodule
