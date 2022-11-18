#!/usr/bin/env sh

set -xue

export HOME=${TMPDIR}
export G_MESSAGES_DEBUG=qw

python3 $(command -v iconker.py) "${@}" | (inkscape --shell 2>/dev/null)
