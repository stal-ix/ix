#!/usr/bin/env sh

set -xue

cp "${1}" .config
make HOSTCC=cc LLVM=1 menuconfig
cp .config ${1}
