////////////////////////////////////////////////////////////////////////////////
///                      File Name: BypassRegister_tb.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-21:42:20                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ns

module BypassRegister_tb;
   reg  TDI;
   reg  ShiftDR;  // = 1, enable shifting TDI
   reg  ClockDR;
   wire TDO;
   initial begin
      $dumpfile("sim/BypassRegister.vcd");  // 指定波形文件名
      $dumpvars(
         0,
         BypassRegister_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      TDI = 1;
      ShiftDR = 0;
      #6;
      ShiftDR = 1;
      #6;
      $finish;
   end
   initial begin
      ClockDR = 0;
      forever #3 ClockDR = ~ClockDR;
   end
   BypassRegister u1 (
      .TDI(TDI),
      .ShiftDR(ShiftDR),  // = 1, enable shifting TDI
      .ClockDR(ClockDR),
      .TDO(TDO)
   );
endmodule
