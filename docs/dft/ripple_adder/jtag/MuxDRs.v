////////////////////////////////////////////////////////////////////////////////
///                           File Name: MuxDRs.v                            ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-14:24:54                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _MUXDRS_V_  // Guard to prevent double-inclusion
`define _MUXDRS_V_

module MuxDRs (
   input BSC,
   input BR,
   input sel,
   output reg DR
);
   always @(*) begin
      case (sel)
         1'b0: DR = BSC;
         1'b1: DR = BR;
         default: DR = BSC;
      endcase
   end
endmodule

`endif
