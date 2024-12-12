.PHONY: all clean

all: random_and_sum.cpp test.sh
	g++ $< -o ggrandom_and_sum.exe
	# g++ -nostdinc++ -L/usr/lib/llvm-19/lib -I/usr/lib/llvm-19/include/c++/v1/ -lc++ -lc++abi $< -o gcrandom_and_sum.exe # an error occurs # an error occurs.
	clang++ $< -o cgrandom_and_sum.exe
	clang++ -nostdinc++ -L/usr/lib/llvm-19/lib -I/usr/lib/llvm-19/include/c++/v1/ -stdlib=libc++ $< -o ccrandom_and_sum.exe
	chmod a+x ./test.sh
	bash ./test.sh

clean:
	echo "Cleaning..."
	- rm -rf *.exe
