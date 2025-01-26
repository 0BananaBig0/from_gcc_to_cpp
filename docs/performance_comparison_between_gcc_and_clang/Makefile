.PHONY: all test test0 test1 test2 test3 alltests clean

CLANG_CXXFLAGS = $(shell llvm-config --cxxflags) -I$(shell llvm-config --includedir)/c++/v1
CLANG_LDFLAGS = $(shell llvm-config --ldflags)
GNU_OPT_LEV = -Ofast
LLVM_OPT_LEV = -O3 -ffast-math

all: ggrandom_and_sum.exe gcrandom_and_sum.exe cgrandom_and_sum.exe ccrandom_and_sum.exe

# gcc/g++ compiler, gcc/g++ libraries
ggrandom_and_sum.exe: random_and_sum.cpp
	g++ ${GNU_OPT_LEV} $< -o $@

# gcc/g++ compiler, clang/clang++ libraries
# An error may occur depending on your operating system.
# For example:
# Compilation errors may occur in Debian but not in OpenSUSE Tumbleweed.
gcrandom_and_sum.exe: random_and_sum.cpp
	@if grep -q "ID=debian" /etc/os-release; then \
		echo "echo \"Debian cannot compile this program with the specified configurations.\"" > $@; \
		chmod a+x $@; \
	else \
		g++ ${GNU_OPT_LEV} -nostdinc++ ${CLANG_CXXFLAGS} ${CLANG_LDFLAGS} -lc++ -lc++abi $< -o gcrandom_and_sum.exe; \
	fi

# clang/clang++ compiler, gcc/g++ libraries
cgrandom_and_sum.exe: random_and_sum.cpp
	clang++ ${LLVM_OPT_LEV} $< -o $@

# clang/clang++ compiler, clang/clang++ libraries
ccrandom_and_sum.exe: random_and_sum.cpp
	clang++ ${LLVM_OPT_LEV} -nostdinc++ ${CLANG_CXXFLAGS} ${CLANG_LDFLAGS} -stdlib=libc++ $< -o $@

test:
	$(MAKE) all
	chmod a+x ./test.sh
	bash ./test.sh

test0:
	$(MAKE) all GNU_OPT_LEV="-O0" LLVM_OPT_LEV="-O0"
	chmod a+x ./test.sh
	bash ./test.sh

test1:
	$(MAKE) all GNU_OPT_LEV="-O1" LLVM_OPT_LEV="-O1"
	chmod a+x ./test.sh
	bash ./test.sh

test2:
	$(MAKE) all GNU_OPT_LEV="-O2" LLVM_OPT_LEV="-O2"
	chmod a+x ./test.sh
	bash ./test.sh

test3:
	$(MAKE) all GNU_OPT_LEV="-O3" LLVM_OPT_LEV="-O3"
	chmod a+x ./test.sh
	bash ./test.sh

alltests:
	@echo "Optimiziation level: GNU=-Ofast, LLVM=-O3 -ffast-math"
	@$(MAKE) clean > /dev/null
	@$(MAKE) all GNU_OPT_LEV="-O3" LLVM_OPT_LEV="-O3 -ffast-math" > /dev/null
	@chmod a+x ./test.sh
	@bash ./test.sh
	@echo -e "\n\n\nOptimiziation level: GNU=LLVM=-O0"
	@$(MAKE) clean > /dev/null
	@$(MAKE) all GNU_OPT_LEV="-O0" LLVM_OPT_LEV="-O0" > /dev/null
	@chmod a+x ./test.sh
	@bash ./test.sh
	@echo -e "\n\n\nOptimiziation level: GNU=LLVM=-O1"
	@$(MAKE) clean > /dev/null
	@$(MAKE) all GNU_OPT_LEV="-O1" LLVM_OPT_LEV="-O1" > /dev/null
	@chmod a+x ./test.sh
	@bash ./test.sh
	@echo -e "\n\n\nOptimiziation level: GNU=LLVM=-O2"
	@$(MAKE) clean > /dev/null
	@$(MAKE) all GNU_OPT_LEV="-O2" LLVM_OPT_LEV="-O2" > /dev/null
	@chmod a+x ./test.sh
	@bash ./test.sh
	@echo -e "\n\n\nOptimiziation level: GNU=LLVM=-O3"
	@$(MAKE) clean > /dev/null
	@$(MAKE) all GNU_OPT_LEV="-O3" LLVM_OPT_LEV="-O3" > /dev/null
	@chmod a+x ./test.sh
	@bash ./test.sh

clean:
	@echo "Cleaning..."
	- rm -rf *.exe
