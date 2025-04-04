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
RTL_SOURCES = $(wildcard $(RTL_DIR)/*.v)

all: $(SIM_DIR)/TopWithoutBC.vcd
$(SIM_DIR)/TopWithoutBC.vcd: $(RTL_SOURCES) tb/TopWithoutBC_tb.v
	mkdir -p $(SIM_DIR)
	$(SIM_TOOL) -o $(SIM_DIR)/$*.out TopWithoutBC.v tb/TopWithoutBC_tb.v
	vvp $(SIM_DIR)/$*.out
	$(WAVE_VIEWER) $@

$(SIM_DIR)/%.vcd: %.v tb/%_tb.v FullAdderCell.v
	mkdir -p $(SIM_DIR)
	$(SIM_TOOL) -o $(SIM_DIR)/$*.out $^
	vvp $(SIM_DIR)/$*.out
	$(WAVE_VIEWER) $@

# 清理生成文件
clean:
	rm -rf $(SIM_DIR)/*
