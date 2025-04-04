////////////////////////////////////////////////////////////////////////////////
///                       File Name: FullAdderCell_tb.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-14:01:32                          ///
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ns

module FullAdderCell_tb;
   reg a, b, cin;
   wire sum, co;
   initial begin
      $dumpfile("sim/FullAdderCell.vcd");  // 指定波形文件名
      $dumpvars(
         0,
         FullAdderCell_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      a   = 0;
      b   = 1;
      cin = 0;
      #3;
      a   = 1;
      b   = 0;
      cin = 1;
      #3;
      $finish;
   end

   FullAdderCell u1 (
      .a  (a),
      .b  (b),
      .cin(cin),
      .sum(sum),
      .co (co)
   );
endmodule
