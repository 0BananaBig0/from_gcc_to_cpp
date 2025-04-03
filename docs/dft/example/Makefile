# ############################################################################ #
# #														File Name: Makefile														 # #
# #													 Author: Huaxiao Liang													 # #
# #													Mail: hxliang666@qq.com													 # #
# #													04/02/2025-Wed-21:51:58													 # #
# ############################################################################ #

.PHONY:
# 工具配置
SIM_TOOL = iverilog    # 可选：vcs, vsim
WAVE_VIEWER = gtkwave  # 可选：dve, verdi

# 文件路径
TB_DIR = ./tb

# 自动查找所有RTL和测试平台文件
RTL_SOURCES = $(wildcard adder/*.v) $(wildcard jtag/*.v) Top.v

all: sim/Top.vcd
sim/Top.vcd: $(RTL_SOURCES) tb/Top_tb.v
	mkdir -p sim
	$(SIM_TOOL) -o sim/Top.out $^
	vvp sim/Top.out
	$(WAVE_VIEWER) $@

# 清理生成文件
clean:
	rm -rf sim/*
