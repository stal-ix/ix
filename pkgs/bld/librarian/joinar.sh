#!/usr/bin/env sh

l=${1}

shift

rm -f *.o

for x in ${@}; do
    safeex ${x}
done

safear ${l} $(ls *.o)

rm -f *.o
