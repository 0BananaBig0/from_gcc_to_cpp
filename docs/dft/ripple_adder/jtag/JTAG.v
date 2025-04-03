////////////////////////////////////////////////////////////////////////////////
///                            File Name: JTAG.v                             ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-14:37:01                          ///
////////////////////////////////////////////////////////////////////////////////

module JTAG #(parameter N = 16) (input TDI,
                                 input TMS,
                                 input TCK,
                                 input[N-1:0] sys_pin_a,
                                 input[N-1:0] sys_pin_b,
                                 input sys_pin_cin,
                                 input sys_pin_sel,
                                 input[N-1:0] module_pin_sum,
                                 input module_pin_co,
                                 output[N-1:0] module_pin_a,
                                 output[N-1:0] module_pin_b,
                                 output module_pin_cin,
                                 output module_pin_sel,
                                 output[N-1:0] sys_pin_sum,
                                 output sys_pin_co,
                                 output TDO);
   wire ShiftDR, ClockDR, UpdateDR, Mode, ShiftIR, ClockIR, UpdateIR;
   wire BSC, BR, IR, sel_DRs, DR, Select, Reset;
   wire [1:0] instruction;
   wire D, Enable;
   reg Q;
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
                        .TDO(BSC));
   BypassRegister u2(.TDI(TDI),
                     .ShiftDR(ShiftDR), // = 1, enable shifting TDI
                     .ClockDR(ClockDR),
                     .TDO(BR));
   InstructionRegister u3(.TDI(TDI),
                          .ShiftIR(ShiftIR),
                          .ClockIR(ClockIR),
                          .UpdateIR(UpdateIR),
                          .Reset(Reset),
                          .TDO(IR),
                          .Q(instruction));
   InstructionDecoder u4(.instruction(instruction),
                         .Mode(Mode),
                         .sel(sel_DRs));
   MuxDRs u5(.BSC(BSC),
             .BR(BR),
             .sel(sel_DRs),
             .DR(DR));
   MuxDRIR u6(.DR(DR),
              .IR(IR),
              .sel(Select),
              .TDO(D));
   always @(negedge TCK) begin
      Q = D;
   end
   TapController u7(.TMS(TMS),
                    .TCK(TCK),
                    .ShiftDR(ShiftDR),
                    .ClockDR(ClockDR),
                    .UpdateDR(UpdateDR),
                    .Select(Select),
                    .ShiftIR(ShiftIR),
                    .ClockIR(ClockIR),
                    .UpdateIR(UpdateIR),
                    .Enable(Enable),
                    .Reset(Reset));
   bufif1(TDO, Q, Enable);
endmodule
