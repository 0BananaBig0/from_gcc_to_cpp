////////////////////////////////////////////////////////////////////////////////
///                   File Name: BoundaryScanChainOutput.v                   ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/03/2025-Thu-17:09:58                          ///
////////////////////////////////////////////////////////////////////////////////


module BoundaryScanChainOutput #(parameter N = 16) (input TDI,
                                                    input ShiftDR,
                                                    input ClockDR,
                                                    input UpdateDR,
                                                    input Mode,
                                                    input[N-1:0] module_pin_sum,
                                                    input module_pin_co,
                                                    output[N-1:0] sys_pin_sum,
                                                    output sys_pin_co,
                                                    output TDO);
   wire[N:0] cell_wire_sum;

   assign cell_wire_sum[0] = TDI;
   genvar i;
   generate
      for(i = 0; i < N; i = i+1) begin
         BoundaryScanCell stage(.sys_pin(module_pin_sum[i]),
                                .last_cell_out(cell_wire_sum[i]),
                                .ShiftDR(ShiftDR),
                                .ClockDR(ClockDR),
                                .UpdateDR(UpdateDR),
                                .Mode(Mode),
                                .to_next_cell(cell_wire_sum[i + 1]),
                                .module_pin(sys_pin_sum[i]));
      end
   endgenerate

   BoundaryScanCell u3(.sys_pin(module_pin_co),
                       .last_cell_out(cell_wire_sum[N]),
                       .ShiftDR(ShiftDR),
                       .ClockDR(ClockDR),
                       .UpdateDR(UpdateDR),
                       .Mode(Mode),
                       .to_next_cell(TDO),
                       .module_pin(sys_pin_co));
endmodule
