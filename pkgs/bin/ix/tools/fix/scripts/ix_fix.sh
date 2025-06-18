#!/usr/bin/env sh

set -xue

cd ${IX_DIR}

cat pkgs/die/scripts/dump.json | ix_flt | while read l; do (
    echo ${l}

    if ix_up ${l}; then
        git add -A
        git commit -m "up ${l}" || true
    else
        echo "FAILED ${l}"
    fi

    git checkout .
) done
