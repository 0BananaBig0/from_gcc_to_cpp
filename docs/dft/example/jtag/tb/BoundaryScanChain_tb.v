////////////////////////////////////////////////////////////////////////////////
///                    File Name: BoundaryScanChain_tb.v                     ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-23:33:36                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module BoundaryScanChain_tb;
   parameter N = 16;
   reg TDI;
   reg ShiftDR;
   reg ClockDR;
   reg UpdateDR;
   reg Mode;
   reg[N-1:0] sys_pin_a;
   reg[N-1:0] sys_pin_b;
   reg sys_pin_cin;
   reg sys_pin_sel;
   reg[N-1:0] module_pin_sum;
   reg module_pin_co;
   wire[N-1:0] module_pin_a;
   wire[N-1:0] module_pin_b;
   wire module_pin_cin;
   wire module_pin_sel;
   wire[N-1:0] sys_pin_sum;
   wire sys_pin_co;
   wire TDO;
   initial begin
      $dumpfile("BoundaryScanChain.vcd");  // 指定波形文件名
      $dumpvars(0, BoundaryScanChain_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      sys_pin_a = 16'h0;
      sys_pin_b = 16'hFFFF;
      sys_pin_cin = 1'b0;
      sys_pin_sel = 1'b0;
      module_pin_sum = 16'h00FF;
      module_pin_co = 1'b0;
      ShiftDR = 0;
      UpdateDR = 0;
      Mode = 0;
      #3;
      sys_pin_a = 16'hFFFF;
      sys_pin_b = 16'h0;
      sys_pin_cin = 1'b1;
      sys_pin_sel = 1'b1;
      module_pin_sum = 16'hFF00;
      module_pin_co = 1'b1;
      ShiftDR = 0;
      UpdateDR = 0;
      Mode = 0;
      #3;
      ShiftDR = 1;
      #306; // 6 * (16 + 16 + 2 + 16 + 1);
      UpdateDR = 1;
      Mode = 1;
      #6;
      $finish;
   end
   initial begin
      ClockDR = 0;
      forever #3 ClockDR = ~ClockDR;
   end
   initial begin
      TDI = 0;
      #6;
      forever #6 TDI = ~TDI;
   end

   BoundaryScanChain u1(.TDI(TDI),
                        .ShiftDR(ShiftDR),
                        .ClockDR(ClockDR),
                        .UpdateDR(UpdateDR),
                        .Mode(Mode),
                        .sys_pin_a(sys_pin_a),
                        .sys_pin_b(sys_pin_b),
                        .sys_pin_cin(sys_pin_cin),
                        .sys_pin_sel(sys_pin_sel),
                        .module_pin_sum(module_pin_sum),
                        .module_pin_co(module_pin_co),
                        .module_pin_a(module_pin_a),
                        .module_pin_b(module_pin_b),
                        .module_pin_cin(module_pin_cin),
                        .module_pin_sel(module_pin_sel),
                        .sys_pin_sum(sys_pin_sum),
                        .sys_pin_co(sys_pin_co),
                        .TDO(TDO));
endmodule
