#!/usr/bin/env sh

set -xue

cd "${1}" || exit 0

find . -type f | while read l; do
    sed -E 's|\.so(\.[0-9]+)*|\.a|g' -i ${l}
    sed -E 's|(\.[0-9]+)*\.dylib|\.a|g' -i ${l}
done
