////////////////////////////////////////////////////////////////////////////////
///                     File Name: InstructionCell_tb.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-00:29:42                          ///
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module InstructionCell_tb;
   reg DI;
   reg TDI;
   reg ShiftIR;
   reg ClockIR;
   reg UpdateIR;
   wire TDO;
   wire Q;
   initial begin
      $dumpfile("wave.vcd");  // 指定波形文件名
      $dumpvars(0, InstructionCell_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      DI = 1;
      TDI = 0;
      ShiftIR = 0;
      UpdateIR = 0;
      #6;
      ShiftIR = 1;
      #6;
      UpdateIR = 1;
      #6;
      $finish;
   end
   initial begin
       ClockIR = 0;
       forever #3 ClockIR = ~ClockIR;
   end

   InstructionCell u1(.DI(DI),
                      .TDI(TDI),
                      .ShiftIR(ShiftIR),
                      .ClockIR(ClockIR),
                      .UpdateIR(UpdateIR),
                      .TDO(TDO),
                      .Q(Q));
endmodule
