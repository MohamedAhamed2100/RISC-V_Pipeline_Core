`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:15 08/07/2024 
// Design Name: 
// Module Name:    Mux_3_by_1 
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
module Mux_3_by_1(
    input [31:0] a, b , c 
	 input [1:0] s ,
	 output [31:0] d
	 
    );
 
 always @(a,b,c,s)
 begin
     if (S==2'b00)
			d = a;
	  else if (S==2'b01)
			d = b;
	  else if (S==2'b01)
			d = c;
	  else
		   d = 32'bx;
 end

endmodule
