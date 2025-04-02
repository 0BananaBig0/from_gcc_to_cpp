////////////////////////////////////////////////////////////////////////////////
///                      File Name: Mux2To1Output_tb.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-20:41:33                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module Mux2To1Output_tb;
   parameter N = 16;
   reg[N-1:0] sum;
   reg co;
   reg[5:0] com_res;
   reg sel;
   wire[N-1:0] sel_res;
   wire sel_co;
   initial begin
      $dumpfile("wave.vcd");  // 指定波形文件名
      $dumpvars(0, Mux2To1Output_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      sum = 16'h0;
      co = 1'b0;
      com_res = 6'b111111;
      sel = 1'b0;
      #3;
      sel = 1'b1;
      #3;
      $finish;
   end

   Mux2To1Output u1(.sum(sum),
                    .co(co),
                    .com_res(com_res),
                    .sel(sel),
                    .sel_res(sel_res),
                    .sel_co(sel_co));
endmodule
