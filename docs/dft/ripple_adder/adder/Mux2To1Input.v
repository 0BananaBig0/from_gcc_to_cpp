////////////////////////////////////////////////////////////////////////////////
///                        File Name: Mux2To1Input.v                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-20:18:21                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _MUX2TO1INPUT_V_
`define _MUX2TO1INPUT_V_

module Mux2To1Input #(
   parameter N = 16
) (
   input [N-1:0] pin_a,
   input [N-1:0] pin_b,
   input pin_cin,
   input [N-1:0] a,
   input [N-1:0] b,
   input cin,
   input sel,
   output reg [N-1:0] sel_a,
   output reg [N-1:0] sel_b,
   output reg sel_cin
);
   always @(*) begin
      case (sel)
         1'b0: begin
            sel_a   = pin_a;
            sel_b   = pin_b;
            sel_cin = pin_cin;
         end
         1'b1: begin
            sel_a   = a;
            sel_b   = b;
            sel_cin = cin;
         end
         default: begin
            sel_a   = pin_a;
            sel_b   = pin_b;
            sel_cin = pin_cin;
         end
      endcase
   end
endmodule

`endif
