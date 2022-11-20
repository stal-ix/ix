#!/usr/bin/env sh

set -xue

cd ${out}

mkdir -p share/glib-2.0/schemas
cd share/glib-2.0/schemas

IFS=':'; for x in ${IX_T_DIR}; do
    cp ${x}/share/glib-2.0/schemas/*.xml ./ || true
    cp ${x}/lib/aux/glib-2.0/schemas/*.xml ./ || true
done
