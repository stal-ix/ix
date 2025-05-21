#!/usr/bin/env sh

llvm-nm --defined-only --extern-only --no-weak "${@}" \
    | grep ' ' \
    | sed -e 's|.* ||' \
    | grep -v '^_Z' \
    | grep -v '^__Z' \
    | sort | uniq
