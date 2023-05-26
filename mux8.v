`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:34 06/14/2022 
// Design Name: 
// Module Name:    mux8 
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

module mux8(
	input [7:0] A, 
	input [7:0] B,
	input S0,
	output [7:0] out
    );
	
	assign out = (S0)? B: A;

endmodule

