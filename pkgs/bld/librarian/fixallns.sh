#!/usr/bin/env sh

find ${1} -type f -name '*.so' | while read l; do
    patchns ${l} $(basename ${l} | sed -e 's|\..*||')_
done
