////////////////////////////////////////////////////////////////////////////////
///                       File Name: TopWithoutBC_tb.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-21:07:23                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module TopWithoutBC_tb;
   parameter N = 16;
   reg[N-1:0] pin_a, pin_b;
   reg pin_cin, pin_sel;
   wire pin_co;
   wire[N-1:0] pin_sum;
   initial begin
      $dumpfile("sim/TopWithoutBC.vcd");  // 指定波形文件名
      $dumpvars(0, TopWithoutBC_tb); // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      pin_a = 16'h0;
      pin_b = 16'hFFFF;
      pin_cin = 1'b0;
      pin_sel = 1'b0;
      #3;
      pin_a = 16'h000F;
      pin_b = 16'h0;
      pin_sel = 1'b1;
      #3;
      $finish;
   end

   TopWithoutBC u1(.pin_a(pin_a),
                   .pin_b(pin_b),
                   .pin_cin(pin_cin),
                   .pin_sel(pin_sel),
                   .pin_sum(pin_sum),
                   .pin_co(pin_co));
endmodule
