////////////////////////////////////////////////////////////////////////////////
///                     File Name: InstructionRegister.v                     ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-00:37:33                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _INSTRUCTIONREGISTER_V_  // Guard to prevent double-inclusion
`define _INSTRUCTIONREGISTER_V_

`include "InstructionCell.v"

module InstructionRegister(input TDI,
                           input ShiftIR,
                           input ClockIR,
                           input UpdateIR,
                           input Reset,
                           output TDO,
                           output[1:0] Q);
   wire cell_wire;
   InstructionCell u1(.DI(1'b0),
                      .TDI(TDI),
                      .ShiftIR(ShiftIR),
                      .ClockIR(ClockIR),
                      .UpdateIR(UpdateIR),
                      .Reset(Reset),
                      .TDO(cell_wire),
                      .Q(Q[0]));
   InstructionCell u2(.DI(1'b1),
                      .TDI(cell_wire),
                      .ShiftIR(ShiftIR),
                      .ClockIR(ClockIR),
                      .UpdateIR(UpdateIR),
                      .Reset(Reset),
                      .TDO(TDO),
                      .Q(Q[1]));
endmodule

`endif
