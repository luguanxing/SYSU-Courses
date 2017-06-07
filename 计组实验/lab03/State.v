`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/15 17:36:51
// Design Name: 
// Module Name: State
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


module State(
	input [2:0] currentState,
	input [5:0] Opcode,
	output reg [2:0] nextState
    );
	
	parameter [2:0] IF = 3'b000;
	parameter [2:0] ID = 3'b001;
	parameter [2:0] EXE_STAGES3 = 3'b101;
	parameter [2:0] EXE_STAGES4 = 3'b110;
	parameter [2:0] EXE_STAGES5 = 3'b010;
	parameter [2:0] MEM = 3'b011;
	parameter [2:0] WB_STAGES4 = 3'b111;
	parameter [2:0] WB_STAGES5 = 3'b100;
	
	always @(currentState or Opcode) begin
		case(currentState)
			IF: begin	//ȡָ��ط���
				nextState = ID;
			end
			ID: begin	//������ʲô���͵�ָ��
				case(Opcode)
					6'b110100:
						nextState = EXE_STAGES3;	//beq
					6'b110000, 6'b110001:
						nextState = EXE_STAGES5;	//lw,sw
					6'b111000, 6'b111010, 6'b111001, 6'b111111:
						nextState = IF;		//j,jal,jr,halt
					default:
						nextState = EXE_STAGES4;
				endcase
			end
			EXE_STAGES3: begin	//3����ָ��
				nextState = IF;
			end
			EXE_STAGES4: begin	//4����ָ��
				nextState = WB_STAGES4;
			end
			EXE_STAGES5: begin	//5����ָ��
				nextState = MEM;
			end
			MEM: begin	//�������ݴ洢��
				case(Opcode)
					6'b110001:	//lw
						nextState = WB_STAGES5;
					default:	//sw
						nextState = IF;
				endcase
			end
			WB_STAGES4: begin	//4����д��
				nextState = IF; 
			end
			WB_STAGES5: begin	//5����д��
				nextState = IF;
			end
			default: begin
				nextState = IF;
			end
		endcase
	end
	
endmodule
