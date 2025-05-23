////////////////////////////////////////////////////////////////////////////////
///                        File Name: Mux2To1Output.v                        ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-20:18:21                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _MUX2TO1OUTPUT_V_
`define _MUX2TO1OUTPUT_V_

module Mux2To1Output #(
   parameter N = 16
) (
   input [N-1:0] sum,
   input co,
   input [5:0] com_res,
   input sel,
   output reg [N-1:0] sel_res,
   output reg sel_co
);
   always @(*) begin
      case (sel)
         1'b0: begin
            sel_res = sum;
            sel_co  = co;
         end
         1'b1: begin
            sel_res[5:0] = com_res;
            sel_res[N-1:6] = sum[N-1:6];
            sel_co = co;
         end
         default: begin
            sel_res = sum;
            sel_co  = co;
         end
      endcase
   end
endmodule

`endif
