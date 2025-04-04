# ############################################################################ #
# #														File Name: Makefile														 # #
# #													 Author: Huaxiao Liang													 # #
# #													Mail: hxliang666@qq.com													 # #
# #													04/02/2025-Wed-21:51:58													 # #
# ############################################################################ #

.PHONY:
# 工具配置
SIM_TOOL = iverilog		 # 可选：vcs, vsim
WAVE_VIEWER = gtkwave  # 可选：dve, verdi

# 文件路径
RTL_DIR = ./
TB_DIR = ./tb
SIM_DIR = ./sim

# 自动查找所有RTL和测试平台文件
RTL_SOURCES = JTAG.v
RTL_SOURCES = $(wildcard $(RTL_DIR)/*.v)

all: $(SIM_DIR)/JTAG.vcd
$(SIM_DIR)/JTAG.vcd: $(RTL_SOURCES) tb/JTAG_tb.v
	mkdir -p $(SIM_DIR)
	$(SIM_TOOL) -o $(SIM_DIR)/JTAG.out JTAG.v tb/JTAG_tb.v
	vvp $(SIM_DIR)/JTAG.out -o $@
	$(WAVE_VIEWER) $@

$(SIM_DIR)/%.vcd: %.v tb/%_tb.v BoundaryScanCell.v InstructionCell.v
	mkdir -p $(SIM_DIR)
	$(SIM_TOOL) -o $(SIM_DIR)/$*.out $^
	vvp $(SIM_DIR)/$*.out -o $@
	$(WAVE_VIEWER) $@

# 清理生成文件
clean:
	rm -rf $(SIM_DIR)/*
