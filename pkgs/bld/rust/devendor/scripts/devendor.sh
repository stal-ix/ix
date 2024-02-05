#!/usr/bin/env sh

set -xue

if test -f .cargo/config; then
    cat .cargo/config >> .cargo/config.toml
    rm .cargo/config
fi

cd "${1}"

find . -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'

rust_classify ${PWD} | grep -v ring | grep -v blake3 | grep -v skia | while read l; do
    echo "devendor ${l}"
    echo 'fn main() {}' > ${l}/build.rs
done
