`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:43 08/07/2024 
// Design Name: 
// Module Name:    Fetch_Cycle 
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
module fetch_cycle( 
    // Declare input & outputs
    input clk, rst,
    input PCSrcE,
    input [31:0] PCTargetE,
    output [31:0] InstrD,
    output [31:0] PCD, PCPlus4D );

    // Declaring interim wires
    wire [31:0] PC_F, PCF, PCPlus4F;
    wire [31:0] InstrF;

    // Declaration of Register
    reg [31:0] InstrF_reg;
    reg [31:0] PCF_reg, PCPlus4F_reg;


    // Initiation of Modules
    // Declare PC Mux
    Mux_2x1 PCMUX (.X1(PCPlus4F),
                   .X2(PCTargetE),
                   .Y(PC_F),
                   .S(PCSrcE)
                     );

    // Declare PC Counter
    Program_counter Prog_counte (
                .CLK(clk),
                .Reset(rst),
                .PC_Next(PC_F),
                .PC(PCF)
                );

    // Declare Instruction Memory
    Instruction_Memory IMEM (
	             .CLK(clk),
                .Reset(rst),
                .A(PCF),
                .RD(InstrF)
                );

    // Declare PC adder
    PCPlus4_Adder PC_adder (
                .PC(PCF),
                .PCPlus4(PCPlus4F)
                );

    // Fetch Cycle Register Logic
    always @(posedge clk or negedge rst) 
	 begin
        if(rst == 1'b1) 
		     begin
					InstrF_reg <= 32'h00000000;
					PCF_reg <= 32'h00000000;
					PCPlus4F_reg <= 32'h00000000;
           end
        else 
			 begin
				   InstrF_reg <= InstrF;
					PCF_reg <= PCF;
					PCPlus4F_reg <= PCPlus4F;
          end
    end


    // Assigning Registers Value to the Output port
    assign  InstrD = (rst == 1'b1) ? 32'h00000000 : InstrF_reg;
    assign  PCD = (rst == 1'b1) ? 32'h00000000 : PCF_reg;
    assign  PCPlus4D = (rst == 1'b1) ? 32'h00000000 : PCPlus4F_reg;


endmodule 
