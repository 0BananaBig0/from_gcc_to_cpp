////////////////////////////////////////////////////////////////////////////////
///                     File Name: BoundaryScanCell_tb.v                     ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-22:18:31                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module BoundaryScanCell_tb;
   reg sys_pin;
   reg last_cell_out;
   reg ShiftDR;
   reg ClockDR;
   reg UpdateDR;
   reg Mode;
   wire to_next_cell;
   wire module_pin;
   initial begin
      $dumpfile("wave.vcd");  // 指定波形文件名
      $dumpvars(0, BoundaryScanCell_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      sys_pin = 1;
      last_cell_out = 0;
      ShiftDR = 0;
      UpdateDR = 0;
      Mode = 0;
      #6;
      UpdateDR = 1;
      #3;
      UpdateDR = 0;
      #3;
      ShiftDR = 1;
      Mode = 1;
      #6;
      UpdateDR = 1;
      #3;
      UpdateDR = 0;
      $finish;
   end
   initial begin
       ClockDR = 0;
       forever #3 ClockDR = ~ClockDR;
   end

   BoundaryScanCell u1(.sys_pin(sys_pin),
                       .last_cell_out(last_cell_out),
                       .ShiftDR(ShiftDR),
                       .ClockDR(ClockDR),
                       .UpdateDR(UpdateDR),
                       .Mode(Mode),
                       .to_next_cell(to_next_cell),
                       .module_pin(module_pin));
endmodule
