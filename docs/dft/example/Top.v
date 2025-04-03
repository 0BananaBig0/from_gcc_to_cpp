////////////////////////////////////////////////////////////////////////////////
///                             File Name: Top.v                             ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-15:42:06                          ///
////////////////////////////////////////////////////////////////////////////////

module Top #(parameter N = 16) (input TDI,
                                input TMS,
                                input TCK,
                                input[N-1:0] sys_pin_a,
                                input[N-1:0] sys_pin_b,
                                input sys_pin_cin,
                                input sys_pin_sel,
                                output[N-1:0] sys_pin_sum,
                                output sys_pin_co,
                                output TDO);
   wire[N-1:0] u1_sum_to_u2_a_b;
   wire u1_co_to_u2_cin, u1_TDO_to_u2_TDI;
   Chip u1(.TDI(TDI),
           .TMS(TMS),
           .TCK(TCK),
           .sys_pin_a(sys_pin_a),
           .sys_pin_b(sys_pin_b),
           .sys_pin_cin(sys_pin_cin),
           .sys_pin_sel(sys_pin_sel),
           .sys_pin_sum(u1_sum_to_u2_a_b),
           .sys_pin_co(u1_co_to_u2_cin),
           .TDO(u1_TDO_to_u2_TDI));

   Chip u2(.TDI(u1_TDO_to_u2_TDI),
           .TMS(TMS),
           .TCK(TCK),
           .sys_pin_a(u1_sum_to_u2_a_b),
           .sys_pin_b(u1_sum_to_u2_a_b),
           .sys_pin_cin(u1_co_to_u2_cin),
           .sys_pin_sel(sys_pin_sel),
           .sys_pin_sum(sys_pin_sum),
           .sys_pin_co(sys_pin_co),
           .TDO(TDO));
endmodule

module Chip #(parameter N = 16) (input TDI,
                                 input TMS,
                                 input TCK,
                                 input[N-1:0] sys_pin_a,
                                 input[N-1:0] sys_pin_b,
                                 input sys_pin_cin,
                                 input sys_pin_sel,
                                 output[N-1:0] sys_pin_sum,
                                 output sys_pin_co,
                                 output TDO);
   wire[N-1:0] pin_a, pin_b, pin_sum;
   wire pin_cin, pin_sel, pin_co;
   JTAG u1(.TDI(TDI),
           .TMS(TMS),
           .TCK(TCK),
           .sys_pin_a(sys_pin_a),
           .sys_pin_b(sys_pin_b),
           .sys_pin_cin(sys_pin_cin),
           .sys_pin_sel(sys_pin_sel),
           .module_pin_sum(pin_sum),
           .module_pin_co(pin_co),
           .module_pin_a(pin_a),
           .module_pin_b(pin_b),
           .module_pin_cin(pin_cin),
           .module_pin_sel(pin_sel),
           .sys_pin_sum(sys_pin_sum),
           .sys_pin_co(sys_pin_co),
           .TDO(TDO));
   TopWithoutBC u2(.pin_a(pin_a),
                   .pin_b(pin_b),
                   .pin_cin(pin_cin),
                   .pin_sel(pin_sel),
                   .pin_sum(pin_sum),
                   .pin_co(pin_co));
endmodule
