`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:18 08/06/2024 
// Design Name: 
// Module Name:    Mux_generic_nb 
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
module Mux_generic_nb 
    #(parameter no_ins = 4 , N = 4)(
      input  [N-1 : 0] W [no_ins-1 : 0] ,
		input  [$clog2(no_ins):0] S,
		output reg [N-1 : 0]F
    );
    
	 integer K ;
	 
	 always @(W,S)
	 begin
	     for(K = 0 ;K < no_ins-1 ;K = K + 1)
		  begin
		      if(K==S)
				   F <= W[K];
				else
               F <= 'bx;				
		  end
	 
	 end

endmodule
