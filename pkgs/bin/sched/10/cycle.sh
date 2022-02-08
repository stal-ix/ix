#!/bin/sh

sleep 10

find /etc/sche.d/10 -type l -name '*.sh'| while read l; do
    echo "run ${l}"
    sh "${l}" || true
    sleep 1
done
