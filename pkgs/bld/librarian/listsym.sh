#!/usr/bin/env sh

llvm-nm --defined-only --extern-only --no-weak "${@}" | grep ' ' | sed -e 's|.* ||' | sort | uniq
