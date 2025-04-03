////////////////////////////////////////////////////////////////////////////////
///                        File Name: TapController.v                        ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-08:25:41                          ///
////////////////////////////////////////////////////////////////////////////////
// Moore machine
module TapController(input TMS,
                     input TCK,
                     output ShiftDR,
                     output ClockDR,
                     output UpdateDR,
                     output Select,
                     output ShiftIR,
                     output ClockIR,
                     output UpdateIR,
                     output Enable,
                     output Reset);

   // Machine state decode
   parameter Test_Logic_Reset = 4'd0;
   parameter Run_Test_Idle  = 4'd1;
   parameter Select_DR_Scan  = 4'd2;
   parameter Capture_DR  = 4'd3;
   parameter Shift_DR  = 4'd4;
   parameter Exit1_DR  = 4'd5;
   parameter Pause_DR  = 4'd6;
   parameter Exit2_DR  = 4'd7;
   parameter Update_DR  = 4'd8;
   parameter Select_IR_Scan  = 4'd9;
   parameter Capture_IR  = 4'd10;
   parameter Shift_IR  = 4'd11;
   parameter Exit1_IR  = 4'd12;
   parameter Pause_IR  = 4'd13;
   parameter Exit2_IR  = 4'd14;
   parameter Update_IR  = 4'd15;

   // Machine variable
   reg [3:0] st_next;
   reg [3:0] st_cur = Test_Logic_Reset;

    // (1) State transfer
   always @(posedge TCK) begin
         st_cur <= st_next;
   end

    // (2) State switch, using block assignment for combination-logic
   always @(*) begin // All case items need to be displayed completely
      case(st_cur)
         Test_Logic_Reset:
            case (TMS)
               1'b0: st_next = Run_Test_Idle;
               1'b1: st_next = Test_Logic_Reset;
            endcase
         Run_Test_Idle:
            case (TMS)
               1'b0: st_next = Run_Test_Idle;
               1'b1: st_next = Select_DR_Scan;
            endcase
         Select_DR_Scan:
            case (TMS)
               1'b0: st_next = Capture_DR;
               1'b1: st_next = Select_IR_Scan;
            endcase
         Capture_DR:
            case (TMS)
               1'b0: st_next = Shift_DR;
               1'b1: st_next = Exit1_DR;
            endcase
         Shift_DR:
            case (TMS)
               1'b0: st_next = Shift_DR;
               1'b1: st_next = Exit1_DR;
            endcase
         Exit1_DR:
            case (TMS)
               1'b0: st_next = Pause_DR;
               1'b1: st_next = Update_DR;
            endcase
         Pause_DR:
            case (TMS)
               1'b0: st_next = Pause_DR;
               1'b1: st_next = Exit2_DR;
            endcase
         Exit2_DR:
            case (TMS)
               1'b0: st_next = Shift_DR;
               1'b1: st_next = Update_DR;
            endcase
         Update_DR:
            case (TMS)
               1'b0: st_next = Run_Test_Idle;
               1'b1: st_next = Select_DR_Scan;
            endcase
         Select_IR_Scan:
            case (TMS)
               1'b0: st_next = Capture_IR;
               1'b1: st_next = Test_Logic_Reset;
            endcase
         Capture_IR:
            case (TMS)
               1'b0: st_next = Shift_IR;
               1'b1: st_next = Exit1_IR;
            endcase
         Shift_IR:
            case (TMS)
               1'b0: st_next = Shift_IR;
               1'b1: st_next = Exit1_IR;
            endcase
         Exit1_IR:
            case (TMS)
               1'b0: st_next = Pause_IR;
               1'b1: st_next = Update_IR;
            endcase
         Pause_IR:
            case (TMS)
               1'b0: st_next = Pause_IR;
               1'b1: st_next = Exit2_IR;
            endcase
         Exit2_IR:
            case (TMS)
               1'b0: st_next = Shift_IR;
               1'b1: st_next = Update_IR;
            endcase
         Update_IR:
            case (TMS)
               1'b0: st_next = Run_Test_Idle;
               1'b1: st_next = Select_DR_Scan;
            endcase
         default: st_next = Test_Logic_Reset;
      endcase // case(st_cur)
   end
   // (3) Output logic,
   // One cycle delayed when using non-block assignment

   wire CaptureDR, CaptureIR;
   assign ShiftDR = (st_cur == Shift_DR);
   assign CaptureDR = (st_cur == Capture_DR);
   assign UpdateDR = (st_cur == Update_DR);
   assign Select = (st_cur == Select_IR_Scan || st_cur == Shift_IR);
   assign ShiftIR = (st_cur == Shift_IR);
   assign CaptureIR = (st_cur == Capture_IR);
   assign UpdateIR = (st_cur == Update_IR);
   assign Enable = (ShiftDR || ShiftIR);
   assign Reset = (st_cur == Test_Logic_Reset);

   reg TCK_DR_en;
   reg TCK_IR_en;
   always @(negedge TCK) begin
      TCK_DR_en = ShiftDR || CaptureDR;
      TCK_IR_en = ShiftIR || CaptureIR;
   end
   and(ClockDR, TCK_DR_en, TCK);
   and(ClockIR, TCK_IR_en, TCK);
endmodule
