////////////////////////////////////////////////////////////////////////////////
///                           File Name: Top_tb.v                            ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-22:28:06                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ns

module Top_tb;
   parameter N = 16;
   reg TDI;
   reg TMS;
   reg TCK;
   reg [N-1:0] sys_pin_a;
   reg [N-1:0] sys_pin_b;
   reg sys_pin_cin;
   reg sys_pin_sel;
   wire [N-1:0] sys_pin_sum;
   wire sys_pin_co;
   wire TDO;
   integer i = 0;
   initial begin
      $dumpfile("sim/Top.vcd");  // 指定波形文件名
      $dumpvars(0,
                Top_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      TDI = 0;
      TMS = 1;
      sys_pin_a = {N{1'b0}};
      sys_pin_b = {N{1'b1}};
      sys_pin_cin = 1'b0;
      sys_pin_sel = 1'b1;
      #30;
      TMS = 0;  // Test_Logic_Reset
      #6;
      TMS = 1;  // Run_Test_Idle
      #12;
      TMS = 0;  // Select_IR_Scan
      #12;
      TMS = 0;  // Shift_IR
      #12;
      TMS = 1;  // Shift_IR
      #12;
      TMS = 0;  // Update_IR
      #12;
      TMS = 1;  // Run_Test_Idle
      #6;
      TMS = 0;  // Select_DR_Scan
      #12;
      for (i = 0; i < N * 3 + 3; i = i + 1) begin
         #6 TDI = ~TDI;  // Shift_DR
      end
      TMS = 1;  // Shift_IR
      #12 TMS = 0;  // Update_DR
      #6 $finish;
   end
   initial begin
      TCK = 0;
      forever #3 TCK = ~TCK;
   end

   Top u1 (
      .TDI(TDI),
      .TMS(TMS),
      .TCK(TCK),
      .sys_pin_a(sys_pin_a),
      .sys_pin_b(sys_pin_b),
      .sys_pin_cin(sys_pin_cin),
      .sys_pin_sel(sys_pin_sel),
      .sys_pin_sum(sys_pin_sum),
      .sys_pin_co(sys_pin_co),
      .TDO(TDO)
   );
endmodule
