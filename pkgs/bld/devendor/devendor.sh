#!/usr/bin/env sh

set -xue

cd "${1}"

find . -type f -name '*.h' -delete
find . -type f -name '*.hh' -delete
find . -type f -name '*.hpp' -delete

find . -type f -name '*.c' | while read l; do
    echo > ${l}
done

find . -type f -name '*.cc' | while read l; do
    echo > ${l}
done

find . -type f -name '*.cpp' | while read l; do
    echo > ${l}
done
