`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/15 17:23:20
// Design Name: 
// Module Name: OutputFunction
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

module OutputFunction(
	input [2:0] state,
	input [5:0] Opcode,
	input Zero,
	output reg RegWre,
	output reg PCWre,
	output reg ALUSrcA,
	output reg ALUSrcB,
	output reg DBDataSrc,
	output reg RD,
	output reg WR,
	output reg InsMemRW,
	output reg WrRegDSrc,
	output reg IRWre,
	output reg[2:0] ALUOp,
	output reg[1:0] ExtSel,
	output reg[1:0] PCSrc,
	output reg[1:0] RegDst
    );

	parameter [2:0] IF = 3'b000;
	parameter [2:0]	ID = 3'b001;
	parameter [2:0]	EXE_3stages = 3'b101;
	parameter [2:0]	EXE_4stages = 3'b110;
	parameter [2:0]	EXE_5stages = 3'b010;
	parameter [2:0]	MEM = 3'b011;
	parameter [2:0]	WB_4stages = 3'b111;
	parameter [2:0]	WB_5stages = 3'b100;


	parameter [5:0] add = 6'b000000;
	parameter [5:0] addi = 6'b000010;
	parameter [5:0] sub = 6'b000001;
	parameter [5:0] ori = 6'b010010;
	parameter [5:0] And = 6'b010001;
	parameter [5:0] Or = 6'b010000;
	parameter [5:0] move = 6'b100000;
	parameter [5:0] sw = 6'b110000;
	parameter [5:0] lw = 6'b110001;
	parameter [5:0] beq = 6'b110100;
	parameter [5:0] halt = 6'b111111;
	parameter [5:0] sll = 6'b011000;
	parameter [5:0] slti = 6'b100110;
	parameter [5:0] slt = 6'b100111;
	parameter [5:0] j = 6'b111000;
	parameter [5:0] jr = 6'b111001;
	parameter [5:0] jal = 6'b111010;
	
	always @(state or Opcode) begin
		RegWre = 0;
		PCWre = 0;
		ALUSrcA = 0;
		ALUSrcB = 0;
		DBDataSrc = 0;
		RD = 0;
		WR = 1;
		WrRegDSrc = 0;
		IRWre = 0;
		ALUOp = 3'b000;
		ExtSel = 2'b00;
		PCSrc = 2'b00;
		RegDst = 2'b00;
		InsMemRW = 1;

		if(state == IF && Opcode != halt)
			PCWre = 1;
		if (Opcode == slti)
			ALUSrcB = 1;
		if (Opcode==sll) begin
			ALUSrcA = 1;
			ALUSrcB = 0;
		end
		if(Opcode==addi||Opcode==ori||Opcode==lw||Opcode==sw)
			ALUSrcB=1;
		if(state==WB_5stages)
			DBDataSrc=1;
		if(state==WB_4stages||state==WB_5stages||(state!=IF&&Opcode==jal))
			RegWre=1;
		if(state==WB_4stages||state==WB_5stages)
			WrRegDSrc=1;
		if(state==MEM&&Opcode==sw) begin
			RD=1;
			WR=0;
		end
		if(state==IF)
			IRWre=1;
			
		case(Opcode)
			sub, beq: ALUOp=3'b001;
			Or, ori: ALUOp=3'b101;
			And: ALUOp=3'b110;
			sll: ALUOp=3'b100;
			slt: ALUOp=3'b010;
			slti: ALUOp=3'b111;
			lw: ALUOp=3'b011;
			default: ALUOp=3'b000;
		endcase
		case(Opcode)
			beq: if(Zero==1) PCSrc = 2'b01;
			jr: PCSrc = 2'b10;
			j, jal: PCSrc = 2'b11;
			default: PCSrc = 2'b00;
		endcase
		case(Opcode)
			jal: RegDst = 2'b00;
			addi, ori, lw, slti: RegDst = 2'b01;
			add, sub, Or, And, move, slt, sll: RegDst = 2'b10;
			default: RegDst = 2'b11;
		endcase
		case(Opcode)
			sll: ExtSel = 2'b00;
			ori: ExtSel = 2'b01;
			addi, lw, sw, beq, slti: ExtSel = 2'b10;
			default: ExtSel = 2'b11;
		endcase
	end

endmodule