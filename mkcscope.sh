#!/bin/sh
rm -rf cscope.files cscope.files
find `pwd` \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.y' -o -name '*.s' -o -name '*.S' \) -print > cscope.files
cscope -b -i cscope.files
