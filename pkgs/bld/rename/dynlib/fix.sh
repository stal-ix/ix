#!/usr/bin/env sh

set -xue

cd "${1}" || exit 0

ls *.so.* *.dylib | while read x; do
    nn=$(echo ${x} | sed -e 's|\..*|\.a|')
    cp -n ${x} ${nn}
done
