////////////////////////////////////////////////////////////////////////////////
///                        File Name: Compactor_tb.v                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-18:06:58                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module Compactor_tb;
   parameter N = 16;
   reg[N-1:0] sum;
   reg co;
   wire[5:0] com_res;
   initial begin
      $dumpfile("wave.vcd");  // 指定波形文件名
      $dumpvars(0, Compactor_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      sum = 16'hFFFF;
      co = 1'b0; // com_res = 6'h22
      #3;
      sum = 16'h0000;
      co = 1'b1; // com_res = 6'h13
      #3;
      $finish;
   end

   Compactor u1(.sum(sum),
                .co(co),
                .com_res(com_res));
endmodule
