////////////////////////////////////////////////////////////////////////////////
///                           File Name: Mux2To1.v                           ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/04/2025-Fri-12:41:03                          ///
////////////////////////////////////////////////////////////////////////////////


`ifndef _MUX2TO1_V_  // Guard to prevent double-inclusion
`define _MUX2TO1_V_

module Mux2To1 (
   input a,
   input b,
   input sel,
   output reg TDO
);
   always @(*) begin
      case (sel)
         1'b0: TDO = a;
         1'b1: TDO = b;
         default: TDO = a;
      endcase
   end
endmodule

`endif
