////////////////////////////////////////////////////////////////////////////////
///                      File Name: BoundaryScanChain.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-22:41:34                          ///
////////////////////////////////////////////////////////////////////////////////

`ifndef _BOUNDARYSCANCHAIN_V_  // Guard to prevent double-inclusion
`define _BOUNDARYSCANCHAIN_V_

`include "BoundaryScanCell.v"

module BoundaryScanChain #(
   parameter N = 16
) (
   input TDI,
   input ShiftDR,
   input ClockDR,
   input UpdateDR,
   input Mode,
   input [N-1:0] sys_pin_a,
   input [N-1:0] sys_pin_b,
   input sys_pin_cin,
   input sys_pin_sel,
   input [N-1:0] module_pin_sum,
   input module_pin_co,
   output [N-1:0] module_pin_a,
   output [N-1:0] module_pin_b,
   output module_pin_cin,
   output module_pin_sel,
   output [N-1:0] sys_pin_sum,
   output sys_pin_co,
   output TDO
);
   wire [N:0] cell_wire_a, cell_wire_b, cell_wire_sum;
   wire cell_wire_cin, cell_wire_sel;

   assign cell_wire_a[0] = TDI;
   genvar i;
   generate
      for (i = 0; i < N; i = i + 1) begin
         BoundaryScanCell stage (
            .sys_pin(sys_pin_a[i]),
            .last_cell_out(cell_wire_a[i]),
            .ShiftDR(ShiftDR),
            .ClockDR(ClockDR),
            .UpdateDR(UpdateDR),
            .Mode(Mode),
            .to_next_cell(cell_wire_a[i+1]),
            .module_pin(module_pin_a[i])
         );
      end
   endgenerate

   assign cell_wire_b[0] = cell_wire_a[N];
   generate
      for (i = 0; i < N; i = i + 1) begin
         BoundaryScanCell stage (
            .sys_pin(sys_pin_b[i]),
            .last_cell_out(cell_wire_b[i]),
            .ShiftDR(ShiftDR),
            .ClockDR(ClockDR),
            .UpdateDR(UpdateDR),
            .Mode(Mode),
            .to_next_cell(cell_wire_b[i+1]),
            .module_pin(module_pin_b[i])
         );
      end
   endgenerate

   BoundaryScanCell u1 (
      .sys_pin(sys_pin_cin),
      .last_cell_out(cell_wire_b[N]),
      .ShiftDR(ShiftDR),
      .ClockDR(ClockDR),
      .UpdateDR(UpdateDR),
      .Mode(Mode),
      .to_next_cell(cell_wire_cin),
      .module_pin(module_pin_cin)
   );
   BoundaryScanCell u2 (
      .sys_pin(sys_pin_sel),
      .last_cell_out(cell_wire_cin),
      .ShiftDR(ShiftDR),
      .ClockDR(ClockDR),
      .UpdateDR(UpdateDR),
      .Mode(Mode),
      .to_next_cell(cell_wire_sel),
      .module_pin(module_pin_sel)
   );

   assign cell_wire_sum[0] = cell_wire_sel;
   generate
      for (i = 0; i < N; i = i + 1) begin
         BoundaryScanCell stage (
            .sys_pin(module_pin_sum[i]),
            .last_cell_out(cell_wire_sum[i]),
            .ShiftDR(ShiftDR),
            .ClockDR(ClockDR),
            .UpdateDR(UpdateDR),
            .Mode(Mode),
            .to_next_cell(cell_wire_sum[i+1]),
            .module_pin(sys_pin_sum[i])
         );
      end
   endgenerate

   BoundaryScanCell u3 (
      .sys_pin(module_pin_co),
      .last_cell_out(cell_wire_sum[N]),
      .ShiftDR(ShiftDR),
      .ClockDR(ClockDR),
      .UpdateDR(UpdateDR),
      .Mode(Mode),
      .to_next_cell(TDO),
      .module_pin(sys_pin_co)
   );
endmodule

`endif
