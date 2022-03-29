#!/usr/bin/env sh

llvm-nm --extern-only --defined-only -A ${1} | sed -e 's|.* ||' | sort | uniq | while read l; do
    llvm-objcopy --redefine-sym "${l}=${2}${l}" ${1}
done
