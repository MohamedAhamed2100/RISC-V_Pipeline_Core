// Copyright 2023 MERL-DSU

//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at

//        http://www.apache.org/licenses/LICENSE-2.0

//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

module writeback_cycle(

// Declaration of IOs
input clk, rst, ResultSrcW,
input [31:0] PCPlus4W, ALU_ResultW, ReadDataW,

output [31:0] ResultW);

// Declaration of Module
Mux_2x1 result_mux (    
                .X1(ALU_ResultW),
                .X2(ReadDataW),
					 .S(ResultW),
                .Y(ResultSrcW)
                );
endmodule
