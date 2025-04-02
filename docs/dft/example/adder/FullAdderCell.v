////////////////////////////////////////////////////////////////////////////////
///                        File Name: FullAdderCell.v                        ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/01/2025-Tue-14:01:32                          ///
////////////////////////////////////////////////////////////////////////////////

module FullAdderCell(input a, input b, input cin, output sum, output co);
  wire c, ab, cci;
  xor(c, a, b);
  xor(sum, c, cin);
  and(ab, a, b);
  and(cci, c, cin);
  or(co, ab, cci);
endmodule
