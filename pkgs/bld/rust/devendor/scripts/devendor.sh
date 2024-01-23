#!/usr/bin/env sh

set -xue

cd "${1}"

find . -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'

#find . -name build.rs | grep '\-sys'
#find . -name build.rs | grep '_sys'

ls -d curl-sys* *jemalloc-sys* libffi-sys* libmimalloc-sys* libssh2-sys* libz-sys* lzma-sys* openssl-src* onig_sys* libgit2-sys* | while read l; do
    echo "devendor ${l}"
    echo 'fn main() {}' > ${l}/build.rs
done
