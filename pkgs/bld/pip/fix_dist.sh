#!/usr/bin/env sh

set -xue

find . -type f -name METADATA | while read l; do
    sed -e 's|.*Requires-Dist.*||' -i "${l}"
done
