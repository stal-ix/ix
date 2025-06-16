#!/usr/bin/env sh

# Collect all defined global symbols from the given library,
# then see which ones are intercepted.
llvm-nm -AgjU ${1} | \
  cut -d ' ' -f 2 | \
  sort -u | \
  cat - $(dirname ${0})/intercepted_symbols.txt | \
  sort | \
  uniq -d | \
  sed 's/.*/& __real_&/' > ${TMPDIR}/redefs
llvm-objcopy --redefine-syms=${TMPDIR}/redefs ${1}
