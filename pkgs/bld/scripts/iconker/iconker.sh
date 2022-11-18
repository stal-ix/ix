#!/usr/bin/env sh

set -xue

export HOME=${TMPDIR}

python3 $(command -v iconker.py) "${@}" | inkscape --shell
