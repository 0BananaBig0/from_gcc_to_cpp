#!/usr/bin/env tclsh
# ############################################################################ #
# #                        File Name: test_iWrite.tcl                        # #
# #                          Author: Huaxiao Liang                           # #
# #                         Mail: hxliang666@qq.com                          # #
# #                         09/25/2025-Thu-23:38:43                          # #
# ############################################################################ #

set_context patterns -ijtag -force
set_ijtag_retargeting_options -ignore_iwrite_when_value_already_present on
set_system_mode setup -force
read_icl ./chip_top.icl -force
set_current_design chip
set_design_level physical_block
set_system_mode analysis -force
open_pattern_set TDR_fix
iWrite Block_1.TDR_2.tdr[2:0] 0b001
iWrite Block_1.TDR_3.tdr[2:0] 0b001
iWrite Block_2.TDR_2.tdr[2:0] 0b001
iWrite Block_2.TDR_3.tdr[2:0] 0b001
iRead Block_1.TDR_2.tdr[8:3] 0b000000
iRead Block_1.TDR_3.tdr[8:3] 0b000000
iRead Block_2.TDR_2.tdr[8:3] 0b000000
iRead Block_2.TDR_3.tdr[8:3] 0b000000
iNote "Write 001 to Block_1 and Block_2."
iApply

iWrite Block_1.TDR_2.tdr[2:0] 0b010
iWrite Block_1.TDR_3.tdr[2:0] 0b010
iWrite Block_2.TDR_2.tdr[2:0] 0b010
iWrite Block_2.TDR_3.tdr[2:0] 0b010
iRead Block_1.TDR_2.tdr[8:3] 0b000101
iRead Block_1.TDR_3.tdr[8:3] 0b000101
iRead Block_2.TDR_2.tdr[8:3] 0b000101
iRead Block_2.TDR_3.tdr[8:3] 0b000101
iNote "Write 010 to Block_1 and Block_2."
iApply

iWrite Block_2.TDR_2.tdr[2:0] 0b011
iWrite Block_2.TDR_3.tdr[2:0] 0b011
iRead Block_1.TDR_2.tdr[8:3] 0b001010
iRead Block_1.TDR_3.tdr[8:3] 0b001010
iRead Block_2.TDR_2.tdr[8:3] 0b001010
iRead Block_2.TDR_3.tdr[8:3] 0b001010
iNote "Write 011 to Block_2."
iApply

# iWrite Block_2.SIB_1.sib 0b1
# iWrite Block_2.SIB_2.sib 0b1
iWrite Block_2.TDR_1_RESET.tdr.EN 0b1
iRead Block_1.TDR_2.tdr[8:3] 0b001010
iRead Block_1.TDR_3.tdr[8:3] 0b001010
iRead Block_2.TDR_2.tdr[8:3] 0b001111
iRead Block_2.TDR_3.tdr[8:3] 0b001111
iNote "Reset Block_2 and automatically unreset Block_2."
iApply

iWrite Block_1.TDR_2.tdr[2:0] 0b100
iWrite Block_1.TDR_3.tdr[2:0] 0b100
iWrite Block_2.TDR_2.tdr[2:0] 0b100
iWrite Block_2.TDR_3.tdr[2:0] 0b100
iRead Block_1.TDR_2.tdr[8:3] 0b001010
iRead Block_1.TDR_3.tdr[8:3] 0b001010
iRead Block_2.TDR_2.tdr[8:3] 0b000000
iRead Block_2.TDR_3.tdr[8:3] 0b000000
iNote "Write 100 to Block_1 and Block_2."
iNote "Has automatically unreset Block_2."
iApply

# iWrite Block_2.TDR_1_RESET.tdr.EN 0b0
iRead Block_1.TDR_2.tdr[8:3] 0b010100
iRead Block_1.TDR_3.tdr[8:3] 0b010100
iRead Block_2.TDR_2.tdr[8:3] 0b010100
iRead Block_2.TDR_3.tdr[8:3] 0b010100
# iNote "Manually unreset Block_2."
iNote "Has automatically unreset Block_2."
iApply

iWrite Block_1.TDR_2.tdr[2:0] 0b101
iWrite Block_1.TDR_3.tdr[2:0] 0b101
iWrite Block_2.TDR_2.tdr[2:0] 0b101
iWrite Block_2.TDR_3.tdr[2:0] 0b101
iRead Block_1.TDR_2.tdr[8:3] 0b010100
iRead Block_1.TDR_3.tdr[8:3] 0b010100
iRead Block_2.TDR_2.tdr[8:3] 0b010100
iRead Block_2.TDR_3.tdr[8:3] 0b010100
iNote "Write 101 to Block_1 and Block_2."
iApply

# iWrite Block_2.SIB_1.sib 0b1
# iWrite Block_2.SIB_2.sib 0b1
iWrite TDR_TOP_RESET.tdr.EN 0b1
iRead Block_1.TDR_2.tdr[8:3] 0b010001
iRead Block_1.TDR_3.tdr[8:3] 0b010001
iRead Block_2.TDR_2.tdr[8:3] 0b010001
iRead Block_2.TDR_3.tdr[8:3] 0b010001
iNote "Reset Block_1 and Block_2, then automatically unreset both."
iApply

iWrite Block_1.TDR_2.tdr[2:0] 0b110
iWrite Block_1.TDR_3.tdr[2:0] 0b110
iWrite Block_2.TDR_2.tdr[2:0] 0b110
iWrite Block_2.TDR_3.tdr[2:0] 0b110
iRead Block_1.TDR_2.tdr[8:3] 0b000000
iRead Block_1.TDR_3.tdr[8:3] 0b000000
iRead Block_2.TDR_2.tdr[8:3] 0b000000
iRead Block_2.TDR_3.tdr[8:3] 0b000000
iNote "Write 110 to Block_1 and Block_2."
iNote "Has automatically unreset Block_1 and Block_2."
iApply

iRead Block_1.TDR_2.tdr[8:3] 0b011110
iRead Block_1.TDR_3.tdr[8:3] 0b011110
iRead Block_2.TDR_2.tdr[8:3] 0b011110
iRead Block_2.TDR_3.tdr[8:3] 0b011110
iNote "Read the last result from Block_1 and Block_2."
iApply
close_pattern_set

write_patterns test_Local_Reset.stil -STIL1999 -pattern_sets TDR_fix -Replace
write_patterns test_Local_Reset.v -Verilog -pattern_sets TDR_fix -Replace
