////////////////////////////////////////////////////////////////////////////////
///                       File Name: RippleFullAdder.v                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-14:27:34                          ///
////////////////////////////////////////////////////////////////////////////////

module RippleFullAdder #(parameter N = 16) (input[N-1:0] a,
                                           input[N-1:0] b,
                                           input cin,
                                           output[N-1:0] sum,
                                           output co);
   wire[N:0] c;

   assign c[0] = cin;
   assign co = c[N];

   genvar i;
   generate
      for(i = 0; i < N; i = i+1) begin:addbit
      FullAdderCell stage(.a(a[i]),
                          .b(b[i]),
                          .cin(c[i]),
                          .sum(sum[i]),
                          .co(c[i + 1]));
      end
   endgenerate

endmodule
