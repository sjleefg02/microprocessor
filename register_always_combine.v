`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:28 06/15/2022 
// Design Name: 
// Module Name:    register_always_combine 
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
module register_always_combine(
   input clk,
	input neg_clk,
   input reset,
   input [1:0] read_register1,
   input [1:0] read_register2,
   input [1:0] write_register,
   input reg_write,
   input [7:0] write_data,
   output [7:0] read_data1,
   output [7:0] read_data2,
   output [7:0] register0,
   output [7:0] register1,
   output [7:0] register2,
   output [7:0] register3,
   output write_now
    );
    
   reg [7:0] register[4:0];
   integer i;
   reg write_en;
   
   assign write_now = write_en;
   
   initial begin
      for (i = 0; i < 4; i = i+1) register[i] = 8'b0;
   end
   
   always@(reg_write, neg_clk, write_en, reset, clk) begin //write_register, write_data, clk, reset
		if (~reg_write && clk && write_en && reset) write_en = 1; // ~clk
		if (negclk) write_en = 0;
		if (~reset) write_en = 0;
	
      if (~write_en) begin
         register[write_register] = write_data;
      end
		
		if (~reset) begin
			for (i = 0; i < 4; i = i+1) register[i] = 8'b0;
		end
   end
   
   /*always @(posedge write_en) begin
      register[write_register] = write_data;
   end*/
   
   assign read_data1 = register[read_register1];
   assign read_data2 = register[read_register2];
   assign register0 = register[0];
   assign register1 = register[1];
   assign register2 = register[2];
   assign register3 = register[3];
   
endmodule
