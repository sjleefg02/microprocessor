`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:20:39 06/14/2022
// Design Name:   microprocessor
// Module Name:   C:/Xilinx/final_project_simple/microprocessor_test.v
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

module microprocessor_test;

	// Inputs
	reg clk_in;
	reg reset;

	// Outputs
	wire [7:0] read_address, instruction;
	wire [6:0] programcounter_one;
	wire [6:0] programcounter_sixteen;
	wire [6:0] data_one;
	wire [6:0] data_sixteen;
	wire clk_out; wire neg_clk_out;
	wire [7:0] register0;
	wire [7:0] register1;
	wire [7:0] register2;
	wire [7:0] register3;
	wire [7:0] mem0;
	wire [7:0] mem1;
	wire [7:0] mem2;
	wire [7:0] mem3;
	wire reg_write;
	wire [1:0] write_register;
	wire reg_dst;
	wire mem_read;
	wire [7:0] mem_read_data;
	wire [7:0] alu_out;
	wire [7:0] reg_read_data1;
	wire [7:0] sign_extend;
	wire [7:0] alu_input2_mux;
	wire alu_src;
	wire write_now;
	wire instruction_sixteen;
	wire instruction_one;

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
		.neg_clk_out(neg_clk_out),
		.register0(register0),
		.register1(register1),
		.register2(register2),
		.register3(register3),
		.mem0(mem0),
		.mem1(mem1),
		.mem2(mem2),
		.mem3(mem3),
		.reg_write(reg_write),
		.write_register(write_register),
		.reg_dst(reg_dst),
		.mem_read(mem_read),
		.mem_read_data(mem_read_data),
		.alu_out(alu_out),
		.sign_extend(sign_extend),
		.reg_read_data1(reg_read_data1),
		.alu_input2_mux(alu_input2_mux),
		.alu_src(alu_src),
		.write_now(write_now),
		.instruction_sixteen(instruction_sixteen),
		.instruction_one(instruction_one)
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

