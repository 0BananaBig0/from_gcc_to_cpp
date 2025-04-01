////////////////////////////////////////////////////////////////////////////////
///                     File Name: InstructionRegister.v                     ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-00:37:33                          ///
////////////////////////////////////////////////////////////////////////////////


module InstructionRegister(input TDI,
                           input ShiftIR,
                           input ClockIR,
                           input UpdateIR,
                           output TDO,
                           output[1:0] Q);
   wire cell_wire;
   InstructionCell u1(.DI(1'b0),
                      .TDI(TDI),
                      .ShiftIR(ShiftIR),
                      .ClockIR(ClockIR),
                      .UpdateIR(UpdateIR),
                      .TDO(cell_wire),
                      .Q(Q[0]));
   InstructionCell u2(.DI(1'b1),
                      .TDI(cell_wire),
                      .ShiftIR(ShiftIR),
                      .ClockIR(ClockIR),
                      .UpdateIR(UpdateIR),
                      .TDO(TDO),
                      .Q(Q[1]));
endmodule
