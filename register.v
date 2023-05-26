`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:10 06/14/2022 
// Design Name: 
// Module Name:    register 
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

module register(
	input clk,
	//input neg_clk,
	input reset,
	input [1:0] read_register1,
	input [1:0] read_register2,
	input [1:0] write_register,
	input reg_write,
	input [7:0] write_data,
	output [7:0] read_data1,
	output [7:0] read_data2,
	/*output [7:0] register0,
	output [7:0] register1,
	output [7:0] register2,
	output [7:0] register3,*/
	output write_now
    );
	 
	reg [7:0] register[3:0];
	integer i;
	wire write_en;
	
	assign write_now = write_en;
	
	initial begin
		register[0] = 8'b0;
		register[1] = 8'b0;
		register[2] = 8'b0;
		register[3] = 8'b0;
	end
	
	/*always@(posedge reset) begin
		for (i = 0; i < 4; i = i+1) register[i] = 8'b0;
	end*/
	
	/*always@(*) begin //write_register, write_data, clk, reset
		if (reg_write && neg_clk && ~reset) write_en = 1;
		if (clk) write_en = 0;
		if (reset) write_en = 0;

	end
	*/
	
	assign write_en = (clk || reset || ~reg_write)? 0 : 1;
	
	always @(posedge write_en or posedge reset) begin
		if (reset) begin
		for (i = 0; i < 4; i = i+1) register[i] = 8'b0;
		end
		else register[write_register] = write_data;
	end
	
	
	/*always @(posedge clk)
	begin
		write_en = 0;
	end*/
	
	assign read_data1 = register[read_register1];
	assign read_data2 = register[read_register2];
	/*assign register0 = register[0];
	assign register1 = register[1];
	assign register2 = register[2];
	assign register3 = register[3];*/
	
endmodule
