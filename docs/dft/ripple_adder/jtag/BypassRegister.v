////////////////////////////////////////////////////////////////////////////////
///                       File Name: BypassRegister.v                        ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-21:37:17                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _BYPASSREGISTER_V_  // Guard to prevent double-inclusion
`define _BYPASSREGISTER_V_

module BypassRegister (
   input TDI,
   input ShiftDR,  // = 1, enable shifting TDI
   input ClockDR,
   output reg TDO
);
   wire D;
   and (D, TDI, ShiftDR);
   always @(posedge ClockDR) begin
      TDO = D;
   end
endmodule

`endif
