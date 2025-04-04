////////////////////////////////////////////////////////////////////////////////
///                       File Name: Broadcaster_tb.v                        ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-15:47:18                          ///
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ns

module Broadcaster_tb;
   parameter N = 16;
   reg pin_a, pin_b;
   wire [N-1:0] a, b;
   wire cin;
   initial begin
      $dumpfile("sim/Broadcaster.vcd");  // 指定波形文件名
      $dumpvars(
         0,
         Broadcaster_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      pin_a = 1'b0;
      pin_b = 1'b1;
      #3;
      pin_a = 1'b1;
      pin_b = 1'b0;
      #3;
      $finish;
   end

   Broadcaster u1 (
      .pin_a(pin_a),
      .pin_b(pin_b),
      .a(a),
      .b(b),
      .cin(cin)
   );
endmodule
