////////////////////////////////////////////////////////////////////////////////
///                     File Name: InstructionDecoder.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-14:14:57                          ///
////////////////////////////////////////////////////////////////////////////////

module InstructionDecoder(input[1:0] instruction,
                          output reg sel);
   parameter EXTEST = 2'd0;
   parameter SAMPLE_PRELOAD = 2'd1;
   parameter INTEST = 2'd2;
   parameter BYPASS = 2'd3;

   always @(*) begin
      case(instruction)
         EXTEST: sel = 0;
         SAMPLE_PRELOAD: sel = 0;
         INTEST: sel = 0;
         BYPASS: sel = 1;
         default: sel = 1;
      endcase
   end
endmodule
