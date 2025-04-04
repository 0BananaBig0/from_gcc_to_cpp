////////////////////////////////////////////////////////////////////////////////
///                      File Name: TapController_tb.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-11:31:30                          ///
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ns

module TapController_tb;
   reg  TMS;
   reg  TCK;
   wire ShiftDR;
   wire ClockDR;
   wire UpdateDR;
   wire Select;
   wire ShiftIR;
   wire ClockIR;
   wire UpdateIR;
   wire Enable;
   wire Reset;
   initial begin
      $dumpfile("sim/TapController.vcd");  // 指定波形文件名
      $dumpvars(
         0,
         TapController_tb);  // 记录所有信号（0表示记录所有层次）
   end
   initial begin
      TMS = 1;  // Test_Logic_Reset
      #30;
      TMS = 0;  // Run_Test_Idle
      #6;
      TMS = 0;  // Run_Test_Idle
      #6;
      TMS = 1;  // Select_DR_Scan
      #6;
      TMS = 0;  // Capture_DR
      #6;
      TMS = 0;  // Shift_DR
      #6;
      TMS = 0;  // Shift_DR
      #6;
      TMS = 1;  // Exit1_DR
      #6;
      TMS = 0;  // Pause_DR
      #6;
      TMS = 0;  // Pause_DR
      #6;
      TMS = 1;  // Exit2_DR
      #6;
      TMS = 0;  // Shift_DR
      #6;
      TMS = 1;  // Exit1_DR
      #6;
      TMS = 1;  // Update_DR
      #6;
      TMS = 0;  // Run_Test_Idle
      #6;
      TMS = 1;  // Select_DR_Scan
      #6;
      TMS = 0;  // Capture_DR
      #6;
      TMS = 1;  // Select_IR_Scan
      #24;
      TMS = 0;  // Capture_IR
      #6;
      TMS = 0;  // Shift_IR
      #6;
      TMS = 0;  // Shift_IR
      #6;
      TMS = 1;  // Exit1_IR
      #6;
      TMS = 0;  // Pause_IR
      #6;
      TMS = 0;  // Pause_IR
      #6;
      TMS = 1;  // Exit2_IR
      #6;
      TMS = 0;  // Shift_IR
      #6;
      TMS = 1;  // Exit1_IR
      #6;
      TMS = 1;  // Update_IR
      #6;
      TMS = 0;  // Run_Test_Idle
      #6;
      TMS = 1;  // Select_IR_Scan
      #12;
      TMS = 0;  // Capture_IR
      #6;
      TMS = 1;  // Test_Logic_Reset
      #30;
      $finish;
   end
   initial begin
      TCK = 0;
      forever #3 TCK = ~TCK;
   end

   TapController u1 (
      .TMS(TMS),
      .TCK(TCK),
      .ShiftDR(ShiftDR),
      .ClockDR(ClockDR),
      .UpdateDR(UpdateDR),
      .Select(Select),
      .ShiftIR(ShiftIR),
      .ClockIR(ClockIR),
      .UpdateIR(UpdateIR),
      .Enable(Enable),
      .Reset(Reset)
   );
endmodule
