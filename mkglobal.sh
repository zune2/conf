#!/bin/sh
rm -rf gtags.files
find `pwd` \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.y' -o -name '*.s' -o -name '*.S' \) -print > gtags.files
gtags --accept-dotfiles -c -f gtags.files
