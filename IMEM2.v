`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:12:57 06/15/2022 
// Design Name: 
// Module Name:    IMEM2 
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

module IMEM2(instruction, Read_Address);

	output [7:0] instruction;
	
	input [7:0] Read_Address;
	
	wire [7:0] MemByte[31:0];
	
	assign MemByte[0] = {2'b01, 2'b10, 2'b10, 2'b01}; // $s2 <- Mem($s2+1) = Mem(0+1) = 1 // 0010
	
	assign MemByte[1] = {2'b01, 2'b01, 2'b01, 2'b01}; // $s1 <- Mem($s1+1) = Mem(0+1) = 1 // 0110
	
	assign MemByte[2] = {2'b01, 2'b10, 2'b11, 2'b11}; // $s3 <- Mem($s2-1) = Mem(1-1) = Mem(0) = 0 // 0110
	
	assign MemByte[3] = {2'b00, 2'b10, 2'b11, 2'b00}; // $s0 <- $s2 + $s3 = 1 + 0 = 1 // 1110
	
	assign MemByte[4] = {2'b10, 2'b01, 2'b00, 2'b01}; // Mem[$s1+1] = Mem[2] <- $s0 = 1 // 0113
	
	assign instruction = MemByte[Read_Address];

endmodule
