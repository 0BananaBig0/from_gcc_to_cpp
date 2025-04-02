////////////////////////////////////////////////////////////////////////////////
///                          File Name: MuxDRIR.v                            ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-14:24:54                          ///
////////////////////////////////////////////////////////////////////////////////

module MuxDRIR(input DR,
               input IR,
               input sel,
               output reg TDO);
   always @(*) begin
      case(sel)
         1'b0: TDO = DR;
         1'b1: TDO = IR;
         default: TDO = DR;
      endcase
   end
endmodule
