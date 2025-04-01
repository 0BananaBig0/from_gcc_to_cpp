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
   always @(posedge UpdateIR) begin
      Q = TDO;
   end
endmodule
