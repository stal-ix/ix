#!/usr/bin/env sh

set -xue

if test -f .cargo/config; then
    cat .cargo/config >> .cargo/config.toml
    rm .cargo/config
fi

cd "${1}"

find . -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'

rust_classify ${PWD} | grep -v ring | grep -v blake3 | grep -v skia | grep -v chrono-tz | grep -v wasmtime-c-api-impl | grep -v cbindgen | grep -v tree-sitter | grep -v libsqlite3-sys | grep -v itt | grep -v sys-info | while read l; do
    echo "devendor ${l}"
    echo 'fn main() {}' > ${l}/build.rs
    find ${l} -type f -name '*.c' | grep -v detect-arch.c | while read x; do
        echo "remove ${x}"
        echo > ${x}
    done
done
