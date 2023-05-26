`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:28 06/14/2022 
// Design Name: 
// Module Name:    alu 
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

module alu(
	input [7:0] data1,
	input [7:0] data2,
	//input ALUOP,
	output [7:0] out
);
	//always @(data1, data2)
	//$display("alu in1: ", data1, "alu in2: ", data2);
	
	assign out  = data1+data2;

endmodule
