////////////////////////////////////////////////////////////////////////////////
///                      File Name: BoundaryScanCell.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-21:55:53                          ///
////////////////////////////////////////////////////////////////////////////////

module BoundaryScanCell(input sys_pin,
                        input last_cell_out,
                        input ShiftDR,
                        input ClockDR,
                        input UpdateDR,
                        input Mode,
                        output to_next_cell,
                        output module_pin);

   wire shift_to_clock;
   reg clock_to_update, update_to_mode;

   assign shift_to_clock = ShiftDR ? last_cell_out : sys_pin;

   always @(posedge ClockDR) begin
      clock_to_update = shift_to_clock;
   end

   assign to_next_cell = clock_to_update;

   always @(posedge UpdateDR) begin
      update_to_mode = clock_to_update;
   end

   assign module_pin = Mode ? update_to_mode : sys_pin;

endmodule
