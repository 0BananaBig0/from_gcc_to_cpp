////////////////////////////////////////////////////////////////////////////////
///                          File Name: Compactor.v                          ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-16:44:04                          ///
////////////////////////////////////////////////////////////////////////////////
/*
00   1 1 1 0 0 0
01   1 1 0 0 0 1
02   1 0 0 0 1 1
03   0 0 0 1 1 1
04   0 1 0 1 0 1
05   0 1 1 0 0 1
06   0 0 1 1 1 0
07   1 0 1 0 1 0
08   1 0 0 1 1 0
09   1 0 0 1 0 1
10   0 1 0 1 1 0
11   0 0 1 0 1 1
12   0 0 1 1 0 1
13   1 0 1 0 0 1
14   0 1 1 0 1 0
15   1 1 0 1 0 0
co   1 1 0 0 1 0
*/
// 1, 2 or odd number error bits without any bit
// 1 error bit with 1 x bit
`ifndef _COMPACTOR_V_
`define _COMPACTOR_V_

module Compactor #(
   parameter N = 16
) (
   input [N-1:0] sum,
   input co,
   output [5:0] com_res
);
   xor (
      com_res[0],
      sum[0],
      sum[1],
      sum[2],
      sum[7],
      sum[8],
      sum[9],
      sum[13],
      sum[15],
      co
   );
   xor (
      com_res[1], sum[0], sum[1], sum[4], sum[5], sum[10], sum[14], sum[15], co
   );
   xor (
      com_res[2],
      sum[0],
      sum[5],
      sum[6],
      sum[7],
      sum[11],
      sum[12],
      sum[13],
      sum[14]
   );
   xor (
      com_res[3],
      sum[3],
      sum[4],
      sum[6],
      sum[8],
      sum[9],
      sum[10],
      sum[12],
      sum[15]
   );
   xor (
      com_res[4],
      sum[2],
      sum[3],
      sum[6],
      sum[7],
      sum[8],
      sum[10],
      sum[11],
      sum[14],
      co
   );
   xor (
      com_res[5],
      sum[1],
      sum[2],
      sum[3],
      sum[4],
      sum[5],
      sum[9],
      sum[11],
      sum[12],
      sum[13]
   );
endmodule

`endif
