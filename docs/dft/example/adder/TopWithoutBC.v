////////////////////////////////////////////////////////////////////////////////
///                        File Name: TopWithoutBC.v                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-20:09:12                          ///
////////////////////////////////////////////////////////////////////////////////

module TopWithoutBC #(parameter N = 16) (input[N-1:0] pin_a,
                                         input[N-1:0] pin_b,
                                         input pin_cin,
                                         input pin_sel,
                                         output[N-1:0] pin_sum,
                                         output pin_co);
   wire[N-1:0] a, b, sel_a, sel_b, sum;
   wire cin, co, sel_cin;
   wire[5:0] com_res;
   Broadcaster u1(.pin_a(pin_a[0]),
                  .pin_b(pin_b[0]),
                  .a(a),
                  .b(b),
                  .cin(cin));
   Mux2To1Input u2(.pin_a(pin_a),
                   .pin_b(pin_b),
                   .pin_cin(pin_cin),
                   .a(a),
                   .b(b),
                   .cin(cin),
                   .sel(pin_sel),
                   .sel_a(sel_a),
                   .sel_b(sel_b),
                   .sel_cin(sel_cin));
   RippleFullAdder u3(.a(sel_a),
                      .b(sel_b),
                      .cin(sel_cin),
                      .sum(sum),
                      .co(co));
   Compactor u4(.sum(sum),
                .co(co),
                .com_res(com_res));
   Mux2To1Output u5(.sum(sum),
                    .co(co),
                    .com_res(com_res),
                    .sel(pin_sel),
                    .sel_res(pin_sum),
                    .sel_co(pin_co));
endmodule
