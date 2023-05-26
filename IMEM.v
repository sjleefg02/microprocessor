`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:35 06/14/2022 
// Design Name: 
// Module Name:    IMEM 
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

module IMEM(instruction, Read_Address);

	output [7:0] instruction;
	
	input [7:0] Read_Address;
	
	wire [7:0] MemByte[31:0];
	
	assign MemByte[0] = {2'b01, 2'b00, 2'b10, 2'b01};
	
	assign MemByte[1] = {2'b11, 2'b00, 2'b00, 2'b01};
	
	assign MemByte[2] = {2'b00, 2'b01, 2'b10, 2'b00};
	
	assign MemByte[3] = {2'b10, 2'b10, 2'b10, 2'b01};
	
	assign MemByte[4] = {2'b01, 2'b00, 2'b11, 2'b01};
	
	assign MemByte[5] = {2'b00, 2'b11, 2'b11, 2'b01};
	
	assign MemByte[6] = {2'b00, 2'b01, 2'b10, 2'b01};
	
	assign MemByte[7] = {2'b00, 2'b00, 2'b00, 2'b00};
	assign MemByte[8] = {2'b00, 2'b00, 2'b01, 2'b01};
	assign MemByte[9] = {2'b00, 2'b00, 2'b10, 2'b10};
	assign MemByte[10] = {2'b00, 2'b00, 2'b11, 2'b11};
	
	assign instruction = MemByte[Read_Address];


endmodule
