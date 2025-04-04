////////////////////////////////////////////////////////////////////////////////
///                       File Name: Mux2To1Input_tb.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-20:29:43                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ns

module Mux2To1Input_tb;
   parameter N = 16;
   reg [N-1:0] pin_a;
   reg [N-1:0] pin_b;
   reg pin_cin;
   reg [N-1:0] a;
   reg [N-1:0] b;
   reg cin;
   reg sel;
   wire [N-1:0] sel_a;
   wire [N-1:0] sel_b;
   wire sel_cin;
   initial begin
      $dumpfile("sim/Mux2To1Input.vcd");  // 指定波形文件名
      $dumpvars(
         0,
         Mux2To1Input_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      pin_a = 16'h0;
      pin_b = 16'h0;
      a = 16'hFFFF;
      b = 16'hFFFF;
      pin_cin = 1'b0;
      cin = 1'b1;
      sel = 1'b0;
      #3;
      sel = 1'b1;
      #3;
      $finish;
   end

   Mux2To1Input u1 (
      .pin_a(pin_a),
      .pin_b(pin_b),
      .pin_cin(pin_cin),
      .a(a),
      .b(b),
      .cin(cin),
      .sel(sel),
      .sel_a(sel_a),
      .sel_b(sel_b),
      .sel_cin(sel_cin)
   );
endmodule
