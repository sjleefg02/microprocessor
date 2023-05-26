`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:46:12 06/14/2022 
// Design Name: 
// Module Name:    control 
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
module control(
		input [1:0] opcode,
		output reg Branch,
		output reg MemtoReg,
		output reg MemRead,
		output reg MemWrite,
		//output reg ALUOP,
		output reg ALUSrc,
		output reg RegWrite,
		output reg RegDst
    );

always @(opcode)
begin
	case(opcode)
		2'b00:
			begin
			Branch <= 0;
			MemtoReg <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			//ALUOP<= 1;
			ALUSrc <= 0;
			RegWrite <= 1;
			RegDst <= 1;
			end
		2'b01:
			begin
			Branch <= 0;
			MemtoReg <= 1;
			MemRead <= 1;
			MemWrite <= 0;
			//ALUOP <= 1;
			ALUSrc <= 1;
			RegWrite<= 1;
			RegDst <= 0;
			end
		2'b10:
			begin
			Branch <= 0;
			MemtoReg <= 1; // x
			MemRead <= 0;
			MemWrite<= 1;
			//ALUOP <= 0;
			ALUSrc <= 1;
			RegWrite <= 0;
			RegDst<= 1; // x
			end
		2'b11:
			begin
			Branch<= 1;
			MemtoReg <= 1; // x
			MemRead<= 0;
			MemWrite <= 0;
			//ALUOP <= 0;
			ALUSrc<= 0;
			RegWrite<= 0;
			RegDst <= 1; // x
			end
	endcase
		
end

endmodule
