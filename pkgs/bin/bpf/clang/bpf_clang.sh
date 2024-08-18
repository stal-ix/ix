#!/usr/bin/env sh

set -ue

exec clang-18 -I${KERNEL_HEADERS} -I${BPF_HEADERS} "${@}"
