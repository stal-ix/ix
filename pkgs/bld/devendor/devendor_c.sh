#!/usr/bin/env sh

set -xue

cd "${1}"

find . -type f -name '*.asm' | while read l; do
    echo ${l}
    echo > ${l}
done

find . -type f -name '*.S' | while read l; do
    echo ${l}
    echo > ${l}
done

find . -type f -name '*.c' | while read l; do
    echo ${l}
    echo > ${l}
done

find . -type f -name '*.cc' | while read l; do
    echo ${l}
    echo > ${l}
done

find . -type f -name '*.cpp' | while read l; do
    echo ${l}
    echo > ${l}
done
