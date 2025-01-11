#!/usr/bin/env sh

set -ue

exec ${FREESTANDING_CLANG} -I${CLANG_HEADERS} -I${KERNEL_HEADERS} -I${BPF_HEADERS} "${@}"
