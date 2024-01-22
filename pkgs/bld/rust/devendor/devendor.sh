#!/usr/bin/env sh

set -xue

(
    find vendored -type f -name build.rs | grep '\-sys/'
    find vendored -type f -name build.rs | grep '_sys/'
) | grep -v glutin | while read l; do
    echo "devendor ${l}"
    echo 'fn main() {}' > ${l}
done

find vendored -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'
