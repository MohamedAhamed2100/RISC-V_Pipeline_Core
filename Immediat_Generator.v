`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:10 08/07/2024 
// Design Name: 
// Module Name:    Immediat_Generator 
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
module Immediat_Generator(
    input      [31:0] Instruction ,
    output reg [31:0] ImmExt
    );
    
	 wire [6 : 0] OP_Code ; 
	 assign OP_Code = Instruction [ 6 : 0 ] ;
    
	 always @ (*)
	 begin 
	    
	    case (OP_Code)
		     7'b0010011 : ImmExt <= { { 20{ Instruction[ 31 ] } } , Instruction[ 31 : 20 ] }; // i - Type
		     7'b0100011 : ImmExt <= { { 20{ Instruction[ 31 ] } } , Instruction[ 31 : 25] , Instruction[ 11 : 7 ] }; // S - Type
		     7'b1100011 : ImmExt <= { { 19{ Instruction[ 31 ] } } , Instruction[ 31 ] , Instruction[ 30 : 25 ] , Instruction[ 11 : 8 ] , 1'b0 }; // B - Type
		     default    : ImmExt <= { { 20{ Instruction[ 31 ] } } , Instruction[ 31 : 20 ] };
		 endcase
		 
	 end 
endmodule
