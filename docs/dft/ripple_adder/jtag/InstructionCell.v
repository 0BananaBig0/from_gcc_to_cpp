////////////////////////////////////////////////////////////////////////////////
///                       File Name: InstructionCell.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-00:18:35                          ///
////////////////////////////////////////////////////////////////////////////////

module InstructionCell(input DI,
                       input TDI,
                       input ShiftIR,
                       input ClockIR,
                       input UpdateIR,
                       input Reset,
                       output reg TDO,
                       output reg Q);
   always @(posedge ClockIR) begin
      if(ShiftIR == 1) begin
         TDO = TDI;
      end
      else begin
         TDO = DI;
      end
   end
   always @(posedge UpdateIR or posedge Reset) begin
      if(Reset == 1) begin
         Q = 1;
      end
      else begin
         Q = TDO;
      end
   end
endmodule
