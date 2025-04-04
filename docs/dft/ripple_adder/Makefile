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
TB_DIR = ./tb
INCLUDES = -I./adder -I./jtag \

# 自动查找所有RTL和测试平台文件
RTL_SOURCES = $(wildcard adder/*.v) $(wildcard jtag/*.v) Top.v


all: sim/Top.vcd
sim/Top.vcd: $(RTL_SOURCES) tb/Top_tb.v
	mkdir -p sim
	$(SIM_TOOL) $(INCLUDES) -o sim/Top.out Top.v tb/Top_tb.v
	vvp sim/Top.out
	$(WAVE_VIEWER) $@

net: Top.json
Top.json: $(RTL_SOURCES) Top.ys
	yosys Top.ys
	netlistsvg Top.json -o Top.html
	firefox Top.html

fsm: Fsm.json
Fsm.json: $(RTL_SOURCES) Fsm.ys
	yosys Fsm.ys
	dot -Tpng Fsm.dot -o Fsm.png
	firefox Fsm.png

# 清理生成文件
clean:
	rm -rf sim/* *.json *.html *.dot *.png
