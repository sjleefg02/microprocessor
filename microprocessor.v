`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:49 06/14/2022 
// Design Name: 
// Module Name:    microprocessor 
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

module microprocessor(
	input [7:0] instruction,
	input clk_in,
	input reset,
	output [7:0] read_address,
	output [6:0] programcounter_one, 
	output [6:0] programcounter_sixteen,
	output [6:0] data_one,
	output [6:0] data_sixteen,
	output clk_out,
	output branch,
	output [6:0] instruction_one,
	output [6:0] instruction_sixteen
	/*output neg_clk_out,
	output [7:0] register0,
	output [7:0] register1,
	output [7:0] register2,
	output [7:0] register3,
	output [7:0] mem0,
	output [7:0] mem1,
	output [7:0] mem2,
	output [7:0] mem3,
	output reg_write,
	output [1:0] write_register,
	output reg_dst,
	output [7:0] mem_read_data,
	output mem_read,
	output [7:0] alu_out,
	output [7:0] reg_read_data1,
	output [7:0] sign_extend,
	output [7:0] alu_input2_mux,
	output alu_src,
	output write_now,
	output reg [7:0] display_reg_write_data*/ 
    );
	 
	 // control signals
	 wire mem_to_reg,  mem_write, reg_write, reg_dst, mem_read, alu_src,clkout;
	 
	 // for register
	 wire [1:0] write_register;
	 wire [7:0] reg_write_data, reg_read_data2, reg_read_data1;
	 
	 wire [7:0] add_with_1_out, jump_out, alu_input2_mux, alu_out, 
	 mem_read_data, sign_extend;
	 reg [7:0]  pc_reg;
	 
	 reg [7:0] display_reg_write_data;
	 //wire change_display;
	 
	 wire [7:0] instruction_; // wire
	 
	 assign instruction_ = instruction;
	 
	 initial begin		 
		pc_reg = 8'b00000000;
	 end
	  
	 freq_divider f1(.clr(reset), .clk(clk_in), .clkout(clkout));
	 
	 control c1(.opcode(instruction_[7:6]),.Branch(branch), .MemtoReg(mem_to_reg), 
	 .MemRead(mem_read),.MemWrite(mem_write), .ALUSrc(alu_src),.RegWrite(reg_write),.RegDst(reg_dst));
	 
	 mux2 mux_by_regdst (.A(instruction_[3:2]), .B(instruction_[1:0]), .S0(reg_dst), .out(write_register));
	 
	 register register_ (.clk(clkout), .reset(reset), 
	 .read_register1(instruction_[5:4]), .read_register2(instruction_[3:2]), 
	 .write_register(write_register), .reg_write(reg_write), .write_data(reg_write_data), 
	 .read_data1(reg_read_data1), .read_data2(reg_read_data2),
	 //.register0(register0), .register1(register1), .register2(register2), .register3(register3),
	 .write_now(write_now));
	 
	 signExtend signextended (.rd(instruction_[1:0]), .offset(sign_extend));
	 
	 mux8 mux_by_alusrc (.A(reg_read_data2), .B(sign_extend), .S0(alu_src), .out(alu_input2_mux));
	 
	 alu alu_ (.data1(reg_read_data1), .data2(alu_input2_mux), .out(alu_out)); 
	 
	 mux8 mux_by_memtoreg (.A(alu_out), .B(mem_read_data), .S0(mem_to_reg), .out(reg_write_data)); 
	 
	 dataMemory memory (.clk(clkout),.reset(reset), .memRead(mem_read), .memWrite(mem_write), 
	 .address(alu_out),.writeData(reg_read_data2), .readData(mem_read_data));
	 //.mem0(mem0), .mem1(mem1), .mem2(mem2), .mem3(mem3));
	 
	 add add_with_1 (.A(pc_reg), .B(8'b00000001), .C(add_with_1_out));
	 
	 add add_2 (.A(add_with_1_out), .B(sign_extend), .C(jump_out));
	 
    always @(posedge clkout or posedge reset)
    begin
      if (reset) begin
         pc_reg = 8'b0;
			end
      else if (branch)
			begin
         pc_reg = jump_out; // <=
			end
      else begin
         pc_reg = add_with_1_out; // <=
			//instruction_ = instruction;
			end
    end
    
    assign read_address = pc_reg;
	 assign clk_out = clkout;
	 
	 always @(*) begin
		if (~write_now) display_reg_write_data <= reg_write_data;
	 end
	 
	 
	 bcd bcd1(display_reg_write_data[7:4], data_sixteen); //reg_write_data [7:4]
	 bcd bcd2(display_reg_write_data[3:0], data_one); //reg_write_data [3:0]
	 
	 bcd bcd3( pc_reg [7:4], programcounter_sixteen);
	 bcd bcd4( pc_reg [3:0], programcounter_one);
	 
	 bcd bcd5(instruction_[7:4], instruction_sixteen);
	 bcd bcd6(instruction_[3:0], instruction_one);
	 
endmodule
