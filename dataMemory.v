`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:46 06/14/2022 
// Design Name: 
// Module Name:    dataMemory 
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

module dataMemory(
	 input memRead,
	 input memWrite,
    input [7:0] address,
	 input [7:0] writeData,
	 input clk,
	 //input neg_clk,
	 input reset,
	 output [7:0] readData
	 /*output [7:0] mem0,
	 output [7:0] mem1,
	 output [7:0] mem2,
	 output [7:0] mem3*/
    );
	 reg[7:0] mem[31:0];
	 integer i;
	 wire write_en;
	 
	 initial begin
		for(i = 0; i < 16; i = i + 1)
			mem[i] <= i;
		for(i = 16; i < 32; i = i + 1)
			mem[i] <= 16-i;
	 end
	 
	 /*always @ (posedge reset) begin
			for(i = 0; i < 16; i = i + 1)
				mem[i] <= i;
			for(i = 16; i < 32; i = i + 1)
				mem[i] <= 16-i;
	 end*/
	 
	 /*always @(posedge clk)
	 begin
		write_en = 0;
	 end*/
		
	 /*always @(address, writeData) begin
			if (memWrite) write_en = 1;
			if (write_en && ~clk) begin
			mem[address] <= writeData;
			write_en = 0;
			end
	 end
	 */
	 
	 /*always@(*) begin
		if (memWrite && neg_clk && ~write_en) write_en = 1; // ~clk
		if (clk) write_en = 0;
		if (reset) write_en = 0;
	end*/
	
	assign write_en = (clk || reset || ~memWrite)? 0: 1;
	
	always @(posedge write_en or posedge reset) begin
		if (reset) begin
		for(i = 0; i < 16; i = i + 1)
				mem[i] <= i;
		for(i = 16; i < 32; i = i + 1)
				mem[i] <= 16-i;
		end
		else begin
		mem[address] <= writeData;
		end
	end
	
	 
	 assign readData = (memRead)? mem[address]: 8'b0; //temp
    
	 /*assign mem0 =  mem[0];
	 assign mem1 = mem[1];
	 assign mem2 = mem[2];
	 assign mem3 = mem[3];*/

endmodule
