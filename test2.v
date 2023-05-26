`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:54:02 06/15/2022
// Design Name:   microprocessor
// Module Name:   C:/Xilinx/final_project_simple/test2.v
// Project Name:  final_project_simple
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: microprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test2;

	// Inputs
	reg clk_in;
	reg reset;

	// Outputs
	wire [7:0] instruction;
	wire [7:0] read_address;
	wire [6:0] programcounter_one;
	wire [6:0] programcounter_sixteen;
	wire [6:0] data_one;
	wire [6:0] data_sixteen;
	wire clk_out;
	wire branch;
	wire [6:0] instruction_one;
	wire [6:0] instruction_sixteen;

	// Instantiate the Unit Under Test (UUT)
	microprocessor uut (
		.instruction(instruction), 
		.clk_in(clk_in), 
		.reset(reset), 
		.read_address(read_address), 
		.programcounter_one(programcounter_one), 
		.programcounter_sixteen(programcounter_sixteen), 
		.data_one(data_one), 
		.data_sixteen(data_sixteen), 
		.clk_out(clk_out), 
		.branch(branch), 
		.instruction_one(instruction_one), 
		.instruction_sixteen(instruction_sixteen)
	);

	IMEM uut1( 
		.instruction(instruction),
		.Read_Address(read_address)
	);
	
	always #10 clk_in = ~clk_in;
	initial begin
		// Initialize Inputs
		clk_in = 0;
		reset = 1;
		
		#100;
		// Wait 100 ns for global reset to finish
		//reset = 1;
			
		reset = 0;
		// Add stimulus here

	end
      
endmodule

