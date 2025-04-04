////////////////////////////////////////////////////////////////////////////////
///                         File Name: Broadcaster.v                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-15:43:30                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _BROADCASTER_V_
`define _BROADCASTER_V_

module Broadcaster #(
   parameter N = 16
) (
   input pin_a,
   input pin_b,
   output [N-1:0] a,
   output [N-1:0] b,
   output cin
);
   assign cin = pin_a;
   genvar i;
   generate
      for (i = 0; i < N; i = i + 1) begin
         assign a[i] = pin_a;
         assign b[i] = pin_b;
      end
   endgenerate
endmodule

`endif
