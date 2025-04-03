////////////////////////////////////////////////////////////////////////////////
///                   File Name: InstructionRegister_tb.v                    ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-00:40:19                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module InstructionRegister_tb;
   reg TDI;
   reg ShiftIR;
   reg ClockIR;
   reg UpdateIR;
   reg Reset;
   wire TDO;
   wire[1:0] Q;
   initial begin
      $dumpfile("sim/InstructionRegister.vcd");  // 指定波形文件名
      $dumpvars(0, InstructionRegister_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      TDI = 0;
      ShiftIR = 0;
      UpdateIR = 0;
      Reset = 0;
      #12;
      ShiftIR = 1;
      #12;
      UpdateIR = 1;
      #6;
      Reset = 1;
      #6
      $finish;
   end
   initial begin
      ClockIR = 0;
      forever #3 ClockIR = ~ClockIR;
   end

   InstructionRegister u1(.TDI(TDI),
                          .ShiftIR(ShiftIR),
                          .ClockIR(ClockIR),
                          .UpdateIR(UpdateIR),
                          .Reset(Reset),
                          .TDO(TDO),
                          .Q(Q));
endmodule
