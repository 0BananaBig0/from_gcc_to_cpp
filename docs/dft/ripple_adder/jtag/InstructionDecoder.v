////////////////////////////////////////////////////////////////////////////////
///                     File Name: InstructionDecoder.v                      ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         04/02/2025-Wed-14:14:57                          ///
////////////////////////////////////////////////////////////////////////////////

module InstructionDecoder(input[1:0] instruction,
                          output reg Mode,
                          output reg sel);
   parameter EXTEST = 2'd0;
   parameter SAMPLE_PRELOAD = 2'd1;
   parameter INTEST = 2'd2;
   parameter BYPASS = 2'd3;

   always @(*) begin
      case(instruction)
         EXTEST: begin
            Mode = 1;
            sel = 0;
         end
         SAMPLE_PRELOAD: begin
            Mode = 0;
            sel = 0;
         end
         INTEST: begin
            Mode = 1;
            sel = 0;
         end
         BYPASS: begin
            Mode = 0;
            sel = 1;
         end
         default: begin
            Mode = 0;
            sel = 1;
         end
      endcase
   end
endmodule
