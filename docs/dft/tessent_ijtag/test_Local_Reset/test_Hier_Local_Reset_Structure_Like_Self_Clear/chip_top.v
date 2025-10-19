////////////////////////////////////////////////////////////////////////////////
///                          File Name: chip_top.v                           ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang666@qq.com                          ///
///                         10/18/2025-Sat-19:42:41                          ///
////////////////////////////////////////////////////////////////////////////////
module chip (
   input ijtag_reset,
   input ijtag_tck,
   input ijtag_si,
   output ijtag_so,
   input ijtag_sel,
   input ijtag_se,
   input ijtag_ue,
   input ijtag_ce,
   output [11:0] EN
);
   // TDR_TOP_RESET conncetions
   wire tdr_top_reset_to_reset;
   wire tdr_top_reset_so;

   RESET_TDR TDR_TOP_RESET (
      .ijtag_reset(ijtag_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(ijtag_si),
      .ijtag_sel(ijtag_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ce(ijtag_ce),
      .ijtag_ue(ijtag_ue),
      .ijtag_to_reset(tdr_top_reset_to_reset),
      .ijtag_so(tdr_top_reset_so)
   );

   // SIB_TOP connections
   wire sib_top_to_sel;
   wire block_2_so;

   SIB SIB_TOP (
      .ijtag_reset(tdr_top_reset_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_sel(ijtag_sel),
      .ijtag_si(tdr_top_reset_so),
      .ijtag_ce(ijtag_ce),
      .ijtag_se(ijtag_se),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(ijtag_so),
      .ijtag_from_so(block_2_so),
      .ijtag_to_sel(sib_top_to_sel)
   );

   // Block_1 connections
   wire block_1_so;
   wire [5:0] block_1_en;

   Block Block_1 (
      .ijtag_reset(tdr_top_reset_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(tdr_top_reset_so),
      .ijtag_so(block_1_so),
      .ijtag_sel(sib_top_to_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ue(ijtag_ue),
      .ijtag_ce(ijtag_ce),
      .EN(block_1_en)
   );

   // Block_2 connections
   Block Block_2 (
      .ijtag_reset(tdr_top_reset_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(block_1_so),
      .ijtag_so(block_2_so),
      .ijtag_sel(sib_top_to_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ue(ijtag_ue),
      .ijtag_ce(ijtag_ce),
      .EN(EN[11:6])
   );

   assign EN[5:0] = block_1_en;

endmodule

module Block (
   input ijtag_reset,
   input ijtag_tck,
   input ijtag_si,
   output ijtag_so,
   input ijtag_sel,
   input ijtag_se,
   input ijtag_ue,
   input ijtag_ce,
   output [5:0] EN
);

   // TDR_1_RESET connections
   wire tdr_1_reset_so;
   wire tdr_1_to_reset;

   RESET_TDR TDR_1_RESET (
      .ijtag_reset(ijtag_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(ijtag_si),
      .ijtag_sel(ijtag_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ce(ijtag_ce),
      .ijtag_ue(ijtag_ue),
      .ijtag_to_reset(tdr_1_to_reset),
      .ijtag_so(tdr_1_reset_so)
   );

   // SIB_1 connections
   wire sib_1_to_sel;
   wire sib_2_so;

   SIB SIB_1 (
      .ijtag_reset(ijtag_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_sel(ijtag_sel),
      .ijtag_si(tdr_1_reset_so),
      .ijtag_ce(ijtag_ce),
      .ijtag_se(ijtag_se),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(ijtag_so),
      .ijtag_from_so(sib_2_so),
      .ijtag_to_sel(sib_1_to_sel)
   );

   // TDR_2 connections
   wire tdr_2_so;
   wire [2:0] tdr_2_en;
   wire [5:0] sensor_3_temp;

   TDR TDR_2 (
      .ijtag_reset(tdr_1_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(tdr_1_reset_so),
      .ijtag_sel(sib_1_to_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ce(ijtag_ce),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(tdr_2_so),
      .Temp(sensor_3_temp),
      .EN(tdr_2_en)
   );

   // SIB_2 connections
   wire sib_2_to_sel;
   wire tdr_3_so;

   SIB SIB_2 (
      .ijtag_reset(tdr_1_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_sel(sib_1_to_sel),
      .ijtag_si(tdr_2_so),
      .ijtag_ce(ijtag_ce),
      .ijtag_se(ijtag_se),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(sib_2_so),
      .ijtag_from_so(tdr_3_so),
      .ijtag_to_sel(sib_2_to_sel)
   );

   // TDR_3 connections
   wire [2:0] tdr_3_en;
   wire [5:0] sensor_4_temp;

   TDR TDR_3 (
      .ijtag_reset(tdr_1_to_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(tdr_2_so),
      .ijtag_sel(sib_2_to_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ce(ijtag_ce),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(tdr_3_so),
      .Temp(sensor_4_temp),
      .EN(tdr_3_en)
   );

   // Sensor instances
   Sensor Sensor_3 (
      .ijtag_tck(ijtag_tck),
      .EN(tdr_2_en),
      .Temp(sensor_3_temp)
   );

   Sensor Sensor_4 (
      .ijtag_tck(ijtag_tck),
      .EN(tdr_3_en),
      .Temp(sensor_4_temp)
   );

   assign EN = {tdr_3_en, tdr_2_en};

endmodule

module RESET_TDR (
   input  wire ijtag_reset,
   input  wire ijtag_sel,
   input  wire ijtag_si,
   input  wire ijtag_ce,
   input  wire ijtag_se,
   input  wire ijtag_ue,
   input  wire ijtag_tck,
   output wire ijtag_to_reset,
   output wire ijtag_so
);
   wire [1:0] ijtag_to_reset_latch;

   TDR_FOR_RESET tdr (
      .ijtag_reset(ijtag_reset),
      .ijtag_tck(ijtag_tck),
      .ijtag_si(ijtag_si),
      .ijtag_sel(ijtag_sel),
      .ijtag_se(ijtag_se),
      .ijtag_ce(ijtag_ce),
      .ijtag_ue(ijtag_ue),
      .ijtag_so(ijtag_so),
      .EN(ijtag_to_reset_latch)
   );

   assign ijtag_to_reset = (ijtag_to_reset_latch[0] == 1'b0) ? ijtag_reset : ijtag_to_reset_latch[1];

endmodule

module TDR_FOR_RESET (
   input wire ijtag_reset,
   input wire ijtag_sel,
   input wire ijtag_si,
   input wire ijtag_ce,
   input wire ijtag_se,
   input wire ijtag_ue,
   input wire ijtag_tck,
   output wire [1:0] EN,
   output wire ijtag_so
);
   reg [1:0] tdr;
   reg retiming_so;
   reg [1:0] ijtag_to_reset_latch;


   // --------- ShiftRegister ---------
   always @(posedge ijtag_tck) begin
      if (ijtag_ce & ijtag_sel) begin
         tdr <= {ijtag_to_reset_latch};
      end else if (ijtag_se & ijtag_sel) begin
         tdr <= {ijtag_si, tdr[1]};
      end
   end

   assign ijtag_so = retiming_so;
   always @(ijtag_tck or tdr[0]) begin
      if (~ijtag_tck) begin
         retiming_so <= tdr[0];
      end
   end

   // --------- DataOutPort EN ---------
   assign EN = ijtag_to_reset_latch;
   always @(negedge ijtag_tck or negedge ijtag_reset) begin
      if (~ijtag_reset) begin
         ijtag_to_reset_latch <= 2'b10;
      end else begin
         if (ijtag_ue & ijtag_sel) begin
            ijtag_to_reset_latch <= tdr;
         end
      end
   end

endmodule

module TDR (
   input wire ijtag_reset,
   input wire ijtag_sel,
   input wire ijtag_si,
   input wire ijtag_ce,
   input wire ijtag_se,
   input wire ijtag_ue,
   input wire ijtag_tck,
   input wire [5:0] Temp,
   output wire [2:0] EN,
   output wire ijtag_so
);
   reg [8:0] tdr;
   reg       retiming_so;
   reg [8:0] EN_latch;


   // --------- ShiftRegister ---------
   always @(posedge ijtag_tck) begin
      if (ijtag_ce & ijtag_sel) begin
         tdr <= {Temp, EN};
      end else if (ijtag_se & ijtag_sel) begin
         tdr <= {ijtag_si, tdr[8:1]};
      end
   end

   assign ijtag_so = retiming_so;
   always @(ijtag_tck or tdr[0]) begin
      if (~ijtag_tck) begin
         retiming_so <= tdr[0];
      end
   end

   // --------- DataOutPort EN ---------
   assign EN = EN_latch[2:0];
   always @(negedge ijtag_tck or negedge ijtag_reset) begin
      if (~ijtag_reset) begin
         EN_latch <= 9'b000000000;
      end else begin
         if (ijtag_ue & ijtag_sel) begin
            EN_latch <= tdr;
         end
      end
   end

endmodule

module SIB (
   input  wire ijtag_reset,
   input  wire ijtag_sel,
   input  wire ijtag_si,
   input  wire ijtag_ce,
   input  wire ijtag_se,
   input  wire ijtag_ue,
   input  wire ijtag_tck,
   output wire ijtag_so,
   input  wire ijtag_from_so,
   output wire ijtag_to_sel
);
   reg sib;
   reg sib_latch;
   reg retiming_so;
   reg to_enable_int;

   assign ijtag_to_sel = to_enable_int & ijtag_sel;
   always @(negedge ijtag_tck or negedge ijtag_reset) begin
      if (~ijtag_reset) begin
         sib_latch <= 1'b0;
      end else if (ijtag_ue & ijtag_sel) begin
         sib_latch <= sib;
      end
   end
   always @(negedge ijtag_tck or negedge ijtag_reset) begin
      if (~ijtag_reset) begin
         to_enable_int <= 1'b0;
      end else begin
         to_enable_int <= sib_latch;
      end
   end

   assign ijtag_so = retiming_so;
   always @(ijtag_tck or sib) begin
      if (~ijtag_tck) begin
         retiming_so <= sib;
      end
   end

   always @(posedge ijtag_tck) begin
      if (ijtag_ce & ijtag_sel) begin
         sib <= 1'b0;
      end else if (ijtag_se & ijtag_sel) begin
         if (sib_latch) begin
            sib <= ijtag_from_so;
         end else begin
            sib <= ijtag_si;
         end
      end
   end

endmodule

module Sensor (
   input ijtag_tck,
   input [2:0] EN,
   output [5:0] Temp
);

   reg [5:0] Temp_reg_1;
   reg [5:0] Temp_reg_2;

   // Update registers on TCK rising edge
   always @(posedge ijtag_tck) begin
      // Store EN with zero padding (EN in bits [2:0], bits [5:3] = 0)
      Temp_reg_1 <= {3'b000, EN};
      // Circular left shift by 2 bits of Temp_reg_1
      Temp_reg_2 <= {Temp_reg_1[3:0], Temp_reg_1[5:4]};
   end
   // Output is XOR of both registers
   assign Temp = Temp_reg_1 ^ Temp_reg_2;
endmodule
