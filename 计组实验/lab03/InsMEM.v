`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 23:35:51
// Design Name: 
// Module Name: InsMEM
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


module InsMEM(
	input [31:0] IAddr,
	input [31:0] InsMemRW,	//无用，永远只读指令
	output reg[31:0] IDataOut
    );
	reg [7:0] memory[0:400]; 
	initial begin
		memory[248] = 8'he0;
		memory[249] = 8'h00;
		memory[250] = 8'h00;
		memory[251] = 8'h40;
	
		memory[252] = 8'hfc;
		memory[253] = 8'h00;
		memory[254] = 8'h00;
		memory[255] = 8'h00;
	
		memory[256] = 8'h48;
		memory[257] = 8'h01;
		memory[258] = 8'h00;
		memory[259] = 8'h02;
		
		memory[260] = 8'h08;
		memory[261] = 8'h02;
		memory[262] = 8'h00;
		memory[263] = 8'h03;
		
		memory[264] = 8'h04;
		memory[265] = 8'h41;
		memory[266] = 8'h18;
		memory[267] = 8'h00;
		
		memory[268] = 8'h40;
		memory[269] = 8'h22;
		memory[270] = 8'h20;
		memory[271] = 8'h00;
		
		memory[272] = 8'h44;
		memory[273] = 8'h61;
		memory[274] = 8'h28;
		memory[275] = 8'h00;
		
		memory[276] = 8'h80;
		memory[277] = 8'h80;
		memory[278] = 8'h30;
		memory[279] = 8'h00;
		
		memory[280] = 8'h44;
		memory[281] = 8'h62;
		memory[282] = 8'h38;
		memory[283] = 8'h00;
		
		memory[284] = 8'he8;
		memory[285] = 8'h00;
		memory[286] = 8'h00;
		memory[287] = 8'h4d;
		
		memory[288] = 8'h9c;
		memory[289] = 8'h41;
		memory[290] = 8'h48;
		memory[291] = 8'h00;
		
		memory[292] = 8'h98;
		memory[293] = 8'h34;
		memory[294] = 8'h00;
		memory[295] = 8'h05;
		
		memory[296] = 8'h60;
		memory[297] = 8'h60;
		memory[298] = 8'h18;
		memory[299] = 8'h40;
		
		memory[300] = 8'hd0;
		memory[301] = 8'h44;
		memory[302] = 8'hff;
		memory[303] = 8'hf3;
		
		memory[304] = 8'hfc;
		memory[305] = 8'h00;
		memory[306] = 8'h00;
		memory[307] = 8'h00;
		
		memory[308] = 8'hc0;
		memory[309] = 8'h26;
		memory[310] = 8'h00;
		memory[311] = 8'h02;
		
		memory[312] = 8'hc4;
		memory[313] = 8'h28;
		memory[314] = 8'h00;
		memory[315] = 8'h02;
		
		memory[316] = 8'he7;
		memory[317] = 8'he0;
		memory[318] = 8'h00;
		memory[319] = 8'h00;
		
	end
	always @ (IAddr)
		begin
			IDataOut = {memory[IAddr],memory[IAddr+1], memory[IAddr+2],memory[IAddr+3]};
		end
endmodule
