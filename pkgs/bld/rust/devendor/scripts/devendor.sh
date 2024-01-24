#!/usr/bin/env sh

set -xue

cd "${1}"

find . -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'

rust_classify ${PWD} | grep -v input-sys | while read l; do
    echo "devendor ${l}"
    echo 'fn main() {}' > ${l}/build.rs
done
