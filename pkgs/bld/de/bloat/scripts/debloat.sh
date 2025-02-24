#!/usr/bin/env sh

set -xue

scanelf -RA -F "%F" "${1}" | while read -r elf; do
    rm -f ${elf}"
done
