#!/usr/bin/env sh

set -ue

exec clang-19 -I${KERNEL_HEADERS} -I${BPF_HEADERS} "${@}"
