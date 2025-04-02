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
RTL_DIR = ./
TB_DIR = ./tb

# 自动查找所有RTL和测试平台文件
RTL_SOURCES = $(wildcard $(RTL_DIR)/*.v)

all: TopWithoutBC.vcd
TopWithoutBC.vcd: $(RTL_SOURCES) tb/TopWithoutBC_tb.v
	$(SIM_TOOL) -o $*.out $^
	vvp $*.out
	$(WAVE_VIEWER) $@

%.vcd: %.v tb/%_tb.v FullAdderCell.v
	$(SIM_TOOL) -o $*.out $^
	vvp $*.out
	$(WAVE_VIEWER) $@

# 清理生成文件
clean:
	rm -rf *.out *.vcd
