#########################################################################
# File Name: test.sh
# Author: Huaxiao Liang
# mail: 1184903633@qq.com
# Created Time: Thu 12 Dec 2024 03:43:17 PM CST
#########################################################################
#!/bin/bash
if [ -e "ggrandom_and_sum.exe" ]; then
   echo "ggrandom_and_sum.exe is running:"
   time ./ggrandom_and_sum.exe
   echo ""
fi

if [ -e "gcrandom_and_sum.exe" ]; then
   echo "gcrandom_and_sum.exe is running:"
   time ./gcrandom_and_sum.exe
   echo ""
fi

if [ -e "cgrandom_and_sum.exe" ]; then
   echo "cgrandom_and_sum.exe is running:"
   time ./cgrandom_and_sum.exe
   echo ""
fi

if [ -e "ccrandom_and_sum.exe" ]; then
   echo "ccrandom_and_sum.exe is running:"
   time ./ccrandom_and_sum.exe
fi
