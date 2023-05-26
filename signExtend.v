`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:06 06/14/2022 
// Design Name: 
// Module Name:    signExtend 
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


module signExtend(
	input [1:0] rd,
	output reg [7:0] offset
	);
	 
	 always @ (rd) begin
		if (rd == 2'b00) begin
			offset = 8'b00000000;//0
		end
		else if (rd == 2'b01) begin
			offset = 8'b00000001;//1
		end
		else if (rd == 2'b10) begin
			offset = 8'b11111110;//-2
		end
		else if (rd == 2'b11) begin
			offset = 8'b11111111;//-1
		end
	end

endmodule

