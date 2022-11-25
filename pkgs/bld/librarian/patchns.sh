#!/usr/bin/env sh

>syms

llvm-nm --extern-only --defined-only -A ${1} | sed -e 's|.* ||' | sort | uniq | while read l; do
    echo "${l} ${2}${l}" >> syms
done

llvm-objcopy --redefine-syms=syms ${1}
