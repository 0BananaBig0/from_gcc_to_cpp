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
iWrite TDR_1.SR[0] 1
iWrite TDR_1.SR[1] 1
iWrite TDR_1.SR[2] 1
iWrite TDR_1.SR[3] 0
iWrite TDR_1.SR[4] 0
iWrite TDR_1.SR[5] 0
iNote "TESSENT_PRAGMA iWriteVar  TDR_1.SR[5:0] TDR_1.SR[5:0]"
iApply
iRead TDR_1.SR[0] 1
iRead TDR_1.SR[1] 1
iRead TDR_1.SR[2] 1
iRead TDR_1.SR[3] 0
iRead TDR_1.SR[4] 0
iRead TDR_1.SR[5] 0
iNote "TESSENT_PRAGMA iReadVar  TDR_1.SR[5:0] TDR_1.SR[5:0]"
iApply

iWrite TDR_1.SR[0] 0
iWrite TDR_1.SR[1] 0
iWrite TDR_1.SR[2] 1
iWrite TDR_1.SR[3] 1
iNote "TESSENT_PRAGMA iWriteVar  TDR_1.SR[3:0] TDR_1.SR[3:0]"
iWrite TDR_2.SR[0] 1
iWrite TDR_2.SR[1] 1
iWrite TDR_2.SR[2] 0
iWrite TDR_2.SR[3] 0
iNote "TESSENT_PRAGMA iWriteVar  TDR_2.SR[3:0] TDR_2.SR[3:0]"
iApply
iWrite TDR_1.SR[1] 1
iWrite TDR_1.SR[2] 0
iNote "TESSENT_PRAGMA iWriteVar  TDR_1.SR[2:1] TDR_1.SR[2:1]"
iWrite TDR_2.SR[1] 0
iWrite TDR_2.SR[2] 1
iNote "TESSENT_PRAGMA iWriteVar  TDR_2.SR[2] TDR_2.SR[2]"
iApply
close_pattern_set

write_patterns test_iWrite.stil -STIL2005 -pattern_sets TDR_fix -Replace
