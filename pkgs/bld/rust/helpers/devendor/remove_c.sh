#!/usr/bin/env sh

set -xue

find ${1} -type f -name '*.c' | grep -v detect-arch.c | while read x; do
    echo "remove ${x}"
    echo > ${x}
done
