#!/usr/bin/env sh

set -xue

# Collect all defined global symbols from the given library,
# then see which ones are intercepted.
llvm-nm -AgjU ${1} | \
  cut -d ' ' -f 2 | \
  sort -u | \
  cat - ${2} | \
  sort | \
  uniq -d | \
  sed 's/.*/& __real_&/' > ${TMPDIR}/redefs

llvm-objcopy --redefine-syms=${TMPDIR}/redefs ${1}
