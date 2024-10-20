#!/usr/bin/env sh

set -ue

exec clang-19 -I$(dirname $(dirname $(command -v clang-19)))/share/include -I${KERNEL_HEADERS} -I${BPF_HEADERS} "${@}"
