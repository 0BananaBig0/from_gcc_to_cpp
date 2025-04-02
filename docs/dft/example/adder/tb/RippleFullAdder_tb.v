////////////////////////////////////////////////////////////////////////////////
///                     File Name: RippleFullAdder_tb.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-14:36:18                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module RippleFullAdder_tb;
   parameter N = 16;
   reg[N-1:0] a, b;
   reg cin;
   wire co;
   wire[N-1:0] sum;
   initial begin
      $dumpfile("RippleFullAdder.vcd");  // 指定波形文件名
      $dumpvars(0, RippleFullAdder_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      a = 16'h0;
      b = 16'hFFFF;
      cin = 1'b0;
      #3;
      a = 16'hFFFF;
      b = 16'h0;
      cin = 1'b1;
      #3;
      $finish;
   end

   RippleFullAdder stage(.a(a),
                         .b(b),
                         .cin(cin),
                         .sum(sum),
                         .co(co));
endmodule
